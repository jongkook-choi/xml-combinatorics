module Main where

data Node = 
    Op {name::String, chilren::[Node], params::[Param]}
    | Var Signal

type Signal = String

data Param = Param { p::String, str::String, value::Float, true::Bool} deriving Show
opChoice :: (Ord a, Num a) => [Node] -> a -> Node
opChoice nodes opt = Op "choice" nodes [Param {p="opt", true=opt>0}]
opAdd :: (t -> Node) -> t -> Node
opAdd n1 n2 = Op "add" [n1 n2] []

---

data Formula = 
    Data String Delay
    | Add Formula Formula

data Delay = D0 | D1 | D2 deriving (Enum)
data Data = EquityData | MacroData | Constant

---

eval :: Data -> String -> Delay -> [[Float]]
eval EquityData x d = [[0]]

---

searchAll :: Node -> [Node]
searchAll _ = 
    []

main :: IO ()
main = putStrLn "Hello, Haskell!"

-- module Main where
-- import Xmlbf
-- import Xmlbf.Xeno
-- import Data.ByteString.UTF8 as BSU
-- import Data.ByteString.Builder as BB
-- import qualified Data.ByteString.Lazy.Char8 as Char8

-- input = "Text<tag prop='value'>Hello, World!</tag><x><y prop=\"x\">Content!</y></x>Trailing."
-- input_bytes = BSU.fromString input
-- input_xml = fromRawXml input_bytes;

-- output_1 = case input_xml of 
--  Left x -> "Error"
--  Right x -> show x
-- -- Right x -> Char8.unpack $ BB.toLazyByteString $ Xmlbf.encode x

-- {--
--  - instance Xmlbf.toXml where
--  - toXml = _ -> [:] traversable
-- --}

-- main = do {
-- putStrLn input;
-- putStrLn output_1;
-- putStrLn "Done";
-- }

