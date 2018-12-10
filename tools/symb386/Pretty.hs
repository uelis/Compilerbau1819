module Pretty where

import Text.PrettyPrint

-- pretty class

class Pretty a where
    ppr :: a -> Doc

instance Pretty a => Pretty (Maybe a) where
  ppr Nothing  = empty
  ppr (Just a) = ppr a