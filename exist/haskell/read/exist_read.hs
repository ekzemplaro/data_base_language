-- ---------------------------------------------------------------------
--	 exist_read.hs
--
--					Oct/18/2012
--
-- ---------------------------------------------------------------------
import Network.Curl
import Text.Regex.Posix

import Xml_manipulate
import Text_manipulate
-- ---------------------------------------------------------------------
main :: IO ()
main = do
	Prelude.putStrLn "*** 開始 ***\n"
	let uri = "http://localhost:8086/exist/rest/cities/cities.xml"
	(_,str_xml)  <- curlGetString uri []
	let dict_aa = to_dict_proc str_xml
	let str_aa = dict_to_str_proc "\t" dict_aa
	Prelude.putStr str_aa
	Prelude.putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
