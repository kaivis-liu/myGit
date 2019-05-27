module Pizza where

data Size = Small | Medium | Large deriving (Show)
data Type = Thin | Thick deriving (Show)
data Surface = Cheese | Sugar deriving (Show)

data Pizza = Pizza { crustSize :: Size
									  ,crustType :: Type
									  ,toppings  :: [Surface]
									  } deriving (Show)

