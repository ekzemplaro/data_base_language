-- -------------------------------------------------------------------
--	master_haskell_read.hs
-- -------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import System.Environment
import Data.Aeson
import Data.Attoparsec (parseOnly)
import Data.Text
import qualified Data.ByteString.Lazy.Char8 as B
import qualified Data.ByteString.Char8 as S

-- import System.IO.UTF8 as U
-- -------------------------------------------------------------------
dict_aa = object [
	"t0421" .= object [
		"name" .= ("仙台" :: Text),
		"population"   .= (51382 :: Int),
		"date_mod"   .= ("2012-7-5" :: Text)
       		],
	"t0422" .= object [
		"name" .= ("石巻" :: Text),
		"population"   .= (89472 :: Int),
		"date_mod"   .= ("2012-9-24" :: Text)
       		],
	"t0423" .= object [
		"name" .= ("塩竈" :: Text),
		"population"   .= (39216 :: Int),
		"date_mod"   .= ("2012-4-1" :: Text)
       		],
	"t0424" .= object [
		"name" .= ("気仙沼" :: Text),
		"population"   .= (21956 :: Int),
		"date_mod"   .= ("2012-7-8" :: Text)
       		],
	"t0425" .= object [
		"name" .= ("白石" :: Text),
		"population"   .= (16825 :: Int),
		"date_mod"   .= ("2012-6-25" :: Text)
       		],
	"t0426" .= object [
		"name" .= ("名取" :: Text),
		"population"   .= (49752 :: Int),
		"date_mod"   .= ("2012-10-8" :: Text)
       		],
	"t0427" .= object [
		"name" .= ("多賀城" :: Text),
		"population"   .= (39184 :: Int),
		"date_mod"   .= ("2012-1-21" :: Text)
       		],
	"t0428" .= object [
		"name" .= ("岩沼" :: Text),
		"population"   .= (48925 :: Int),
		"date_mod"   .= ("2012-5-9" :: Text)
       		],
	"t0429" .= object [
		"name" .= ("大崎" :: Text),
		"population"   .= (82317 :: Int),
		"date_mod"   .= ("2012-3-10" :: Text)
       		]
    ]
-- -------------------------------------------------------------------
main = do
	putStrLn "Content-type: text/json\n\n"

	let str_out = encode dict_aa
	B.putStrLn str_out
-- -------------------------------------------------------------------
