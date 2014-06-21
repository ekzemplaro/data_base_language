-- -------------------------------------------------------------------
--	text_haskell_read.hs
--
--					Nov/12/2012
-- -------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import System.Environment
import Data.Aeson
import Data.Attoparsec (parseOnly)
import Data.Text
import qualified Data.ByteString.Lazy.Char8 as B
import qualified Data.ByteString.Char8 as S

import Text_manipulate
-- -------------------------------------------------------------------
main = do
	putStrLn "Content-type: text/json\n\n"

	let in_file = "/var/tmp/plain_text/cities.txt"
	inStr <- readFile in_file
	let hash_aa = str_to_dict_proc inStr
	putStr inStr

	let str_out = encode hash_aa
	B.putStrLn str_out
-- -------------------------------------------------------------------
