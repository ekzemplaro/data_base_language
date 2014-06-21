-- -------------------------------------------------------------------
--	json_haskell_read.hs
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
-- -------------------------------------------------------------------
main = do
	putStrLn "Content-type: text/json\n\n"

	let in_file = "/var/tmp/json/cities.json"
	inStr <- readFile in_file
	putStr inStr
-- -------------------------------------------------------------------
