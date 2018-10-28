module Ast where

type Identifier = String
type ClassId = String
type FieldId = String
type MethId  = String
type ParamId = String
type LocalId = String

data Operation = And | Lt | Plus | Minus | Times | Divide
  deriving (Show,Eq,Enum,Ord)

data Program = Program MainDecl [ClassDecl]
  deriving (Show,Eq)

data MethDecl = MethDecl
  { mdReturnType        :: Type
  , mdMethId            :: MethId
  , mdParams            :: [ParamDecl]
  , mdThrowsIOException :: Bool
  , mdLocals            :: [VarDecl]
  , mdStms              :: [Statement]
  , mdReturn            :: Expression
  } deriving (Show,Eq)

data ClassDecl = ClassDecl
  { cdClassId :: ClassId
  , cdExtends :: Maybe ClassId
  , cdFields  :: [FieldDecl]
  , cdMethods :: [MethDecl]
  } deriving (Show,Eq)

data MainDecl = MainDecl
  { maindClassId :: ClassId
  , maindParam   :: ParamId
  , maindThrowsIOException :: Bool
  , maindBody :: Statement
  } deriving (Show,Eq)

data Type = BoolTy | IntTy | ObjTy ClassId | ArrTy
  deriving (Show,Eq)

type ParamDecl = (Type, ParamId)
data VarDecl   = VarDecl Type LocalId
  deriving (Show,Eq)
type FieldDecl = VarDecl


data Statement
    = SList [Statement] -- { s1; ... sn; }
    | IfStm Expression Statement Statement
    | WhileStm Expression Statement
    | WriteStm Expression    -- System.out.write
    | PrintlnStm Expression  -- System.out.println
    | AssignStm Identifier Expression
    | ArrAssignStm Identifier Expression Expression -- x[e1] = e2;
  deriving (Show,Eq)


data Expression
    = CTrue
    | CFalse
    | This
    | NewInt Expression -- new int[e]
    | New ClassId
    | Not Expression
    | Infx Expression Operation Expression
    | Get Expression Expression              -- e1[e2]
    | Len Expression
    | Invoke (Maybe ClassId) Expression MethId [Expression]
    | Read    -- System.out.read()
    | IConst Int
    | Id Identifier
 deriving (Eq,Show)
