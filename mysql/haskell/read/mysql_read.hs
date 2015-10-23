-- -----------------------------------------------------------------
--	mysql_read.hs
--
--					Oct/03/2012
--
-- -----------------------------------------------------------------
import System.Environment
import Database.HDBC
import Database.HSQL.MySQL

-- module Main where

-- import IO
-- import qualified Database.HSQL as DB
-- import qualified Database.HSQL.MySQL as MySQL
-- import qualified Control.Exception as E

host     = "host_mysql"
db       = "city"
user     = "scott"
password = "tiger"

-- main :: IO ()
main = do
	putStrLn "*** 開始 ***"
--
--	process `E.catch` print
--	process `DB.catchSql` print
	putStrLn ""
	putStrLn "*** 終了 ***"
	where
	process = bracket (MySQL.connect host db user password) DB.disconnect proc
	proc conn = do
		init conn
		q conn
	init conn = DB.execute conn "set names utf8"
	q conn = bracket (DB.query conn "select * from cities")
                         DB.closeStatement
                         (DB.forEachRow' p)
	p stmt = mapM_ (printColumn stmt) $ first $ unzip3 $ DB.getFieldsTypes stmt
		where
		first (x, _, _) = x
		printColumn stmt name = do
		v <- DB.getFieldValue stmt name
		putStr $ v ++ " (" ++ (show $ length v) ++ ")"
-- -----------------------------------------------------------------
