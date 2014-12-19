#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	json_create.hs
--
--					Dec/12/2014
-- -----------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
 
import System.Environment
import Data.Aeson
import Data.Text
import qualified Data.ByteString.Lazy.Char8 as BB
 

-- -----------------------------------------------------------------
dict_aa = object [
	"t0921" .= object [
		"name" .= ("宇都宮" :: Text),
		"population"   .= (51492 :: Int),
		"date_mod"   .= ("1960-2-5" :: Text)
       		],
	"t0922" .= object [
		"name" .= ("小山" :: Text),
		"population"   .= (89276 :: Int),
		"date_mod"   .= ("1960-9-24" :: Text)
       		],
	"t0923" .= object [
		"name" .= ("佐野" :: Text),
		"population"   .= (39215 :: Int),
		"date_mod"   .= ("1960-4-1" :: Text)
       		],
	"t0924" .= object [
		"name" .= ("足利" :: Text),
		"population"   .= (21457 :: Int),
		"date_mod"   .= ("1960-7-8" :: Text)
       		],
	"t0925" .= object [
		"name" .= ("日光" :: Text),
		"population"   .= (16825 :: Int),
		"date_mod"   .= ("1960-6-25" :: Text)
       		],
	"t0926" .= object [
		"name" .= ("下野" :: Text),
		"population"   .= (49352 :: Int),
		"date_mod"   .= ("1960-10-8" :: Text)
       		],
	"t0927" .= object [
		"name" .= ("さくら" :: Text),
		"population"   .= (39785 :: Int),
		"date_mod"   .= ("1960-1-21" :: Text)
       		],
	"t0928" .= object [
		"name" .= ("矢板" :: Text),
		"population"   .= (64812 :: Int),
		"date_mod"   .= ("1960-5-9" :: Text)
       		],
	"t0929" .= object [
		"name" .= ("真岡" :: Text),
		"population"   .= (98235 :: Int),
		"date_mod"   .= ("1960-3-10" :: Text)
       		],
	"t0930" .= object [
		"name" .= ("栃木" :: Text),
		"population"   .= (27548 :: Int),
		"date_mod"   .= ("1960-7-22" :: Text)
       		],
	"t0931" .= object [
		"name" .= ("大田原" :: Text),
		"population"   .= (65281 :: Int),
		"date_mod"   .= ("1960-2-6" :: Text)
       		],
	"t0932" .= object [
		"name" .= ("鹿沼" :: Text),
		"population"   .= (43864 :: Int),
		"date_mod"   .= ("1960-10-12" :: Text)
       		],
	"t0933" .= object [
		"name" .= ("那須塩原" :: Text),
		"population"   .= (25837 :: Int),
		"date_mod"   .= ("1960-7-4" :: Text)
       		],
	"t0934" .= object [
		"name" .= ("那須烏山" :: Text),
		"population"   .= (51923 :: Int),
		"date_mod"   .= ("1960-5-12" :: Text)
       		]
    ]
 
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let out_file = Prelude.head args
	let str_out = encode dict_aa
	BB.writeFile out_file str_out
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
