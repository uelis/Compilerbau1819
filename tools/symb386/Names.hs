module Names where

import Text.PrettyPrint
import Pretty

-- temps

newtype Temp = Temp String deriving (Eq, Ord)

instance Show Temp where
    show (Temp i) = "t" ++ i

instance Pretty Temp where
    ppr t = text $ show t

class Temporary a where
    temp :: Temp -> a

instance Temporary Temp where
    temp = id

-- label

type Label = String
