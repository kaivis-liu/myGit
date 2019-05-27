module Cart where
import Graphics.UI.WX

-- Local DB for Cart

type PizzaType = Int
type PizzaNum  = Int
type Record    = (PizzaType,PizzaNum)
type LocalOrder = [Record]
--data LocalOrder = LocalOrder {
--                      order :: [Record]
--                    } deriving (Show)
--
--
--newLocalOrder :: LocalOrder
--newLocalOrder = LocalOrder { order = [] }
--newLocalOrder = LocalOrder { order = [(1,2)] }


localOrder :: LocalOrder
localOrder = []

newLocalOrder :: LocalOrder -> LocalOrder
newLocalOrder lo = []

delLocalOrder :: LocalOrder -> LocalOrder
delLocalOrder lo = []

addRecord:: Record -> LocalOrder -> LocalOrder
addRecord r localOrder = r:localOrder

price:: [Int]
price = [ 94,85,62,62,62,62,52,55,62 ]