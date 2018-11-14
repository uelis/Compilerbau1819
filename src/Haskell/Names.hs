{-# LANGUAGE GeneralizedNewtypeDeriving, UndecidableInstances, TypeSynonymInstances, FlexibleInstances #-}

module Names(
  Temp, Label(..), mkLabel, mkNamedTemp, avoid,
  MonadNameGen, nextTemp, nextLabel,
  NameGen, runNameGen,
  NameGenT, runNameGenT,
  freshNames
  ) where

import Control.Monad.Trans
import Control.Monad.Identity
import Control.Monad.Trans.Except
import Control.Monad.Trans.State
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Reader (ReaderT)
import Control.Monad.Trans.Writer

import Data.Word

data Temp = NamedTemp String | Temp Word32
   deriving (Eq, Ord)

instance Show Temp where
    show (Temp i) = "t" ++ show i
    show (NamedTemp s) = s

-- May lead to name clashes with 'nextTemp'
-- User must take care to avoid clashes.
mkNamedTemp :: String -> Temp
mkNamedTemp s = NamedTemp s

newtype Label = Label { label :: String }
  deriving (Eq, Ord)

instance Show Label where
  show = label

mkLabel :: String -> Label
mkLabel l | ('$' `elem` l) =
              error $ "Label \"" ++ l ++ "\" contains reserver character '$'."
          | otherwise = Label $ 'L':l

class (Functor m, Monad m) => MonadNameGen m where
  nextTemp :: m Temp
  avoid :: [Temp] -> m ()
  nextLabel :: m Label

newtype NameGenT m a = NameGenT (StateT ([Temp], [Label]) m a)
  deriving (Functor, Applicative, Monad, MonadTrans)

type NameGen a = NameGenT Identity a

runNameGen :: NameGenT Identity a -> a
runNameGen = runIdentity . runNameGenT

instance (Functor m, Monad m) => MonadNameGen (NameGenT m) where
  nextTemp = NameGenT $ do (t:ts, ls) <- get; put (ts, ls); return t
  nextLabel = NameGenT $ do (ts, l:ls) <- get; put (ts, ls); return l
  avoid av =
    NameGenT $
      do (ts, ls) <- get
         put (filter (\t -> not (show t `elem` (map show av))) ts, ls)
         return ()

runNameGenT :: (Functor m, Monad m) => NameGenT m a -> m a
runNameGenT (NameGenT x) =
   evalStateT x ([Temp i | i<-[0..]], [Label $ "L$" ++ (show i) | i <- [(0::Int)..]])

instance MonadNameGen m => MonadNameGen (MaybeT m) where
  nextTemp = lift nextTemp
  nextLabel = lift nextLabel
  avoid m = lift $ avoid m

instance (MonadNameGen m) => MonadNameGen (ExceptT e m) where
  nextTemp = lift nextTemp
  nextLabel = lift nextLabel
  avoid m = lift $ avoid m

instance (MonadNameGen m) => MonadNameGen (ReaderT a m) where
  nextTemp = lift nextTemp
  nextLabel = lift nextLabel
  avoid m = lift $ avoid m

instance (Monoid a, MonadNameGen m) => MonadNameGen (WriterT a m) where
  nextTemp = lift nextTemp
  nextLabel = lift nextLabel
  avoid m = lift $ avoid m

-- | Create for a list of temps a renaming into fresh temps.
freshNames :: MonadNameGen m => [Temp] -> m (Temp -> Temp)
freshNames [] = return (\x -> x)
freshNames (t:ts) =
  do t' <- nextTemp
     f <- freshNames ts
     return (\x -> if x == t then t' else f x)
