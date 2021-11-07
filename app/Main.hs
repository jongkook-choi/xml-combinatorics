module Main where
import Xmlbf
import Xmlbf.Xeno
import Data.ByteString.UTF8 as BSU
import Data.ByteString.Builder as BB
import qualified Data.ByteString.Lazy.Char8 as Char8

input = "Text<tag prop='value'>Hello, World!</tag><x><y prop=\"x\">Content!</y></x>Trailing."
input_bytes = BSU.fromString input
input_xml = fromRawXml input_bytes;

output_1 = case input_xml of 
 Left x -> "Error"
 Right x -> show x
-- Right x -> Char8.unpack $ BB.toLazyByteString $ Xmlbf.encode x

{--
 - instance Xmlbf.toXml where
 - toXml = _ -> [:] traversable
--}

main = do {
putStrLn input;
putStrLn output_1;
putStrLn "Done";
}

