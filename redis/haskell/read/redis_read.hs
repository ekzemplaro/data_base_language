-- -----------------------------------------------------------------
-- redis_read.hs
--
--						Dec/07/2010
--
-- -----------------------------------------------------------------
module RedisTest where

-- import Network.Redis(Redis)
import qualified Database.Redis as R
import Database.Redis.Protocol as Single
import Database.Redis.Serializable(Serializable(..))
import Database.Redis.Key

import	System.IO.UTF8 as U
main = do
	U.putStrLn ("*** 開始 ***")
	server <- Single.connect "host_redis" 6379
 	doGet server "1851"
	U.putStr ("1852\t")
 	doGet server "1852"
 	doGet server "1853"
 	doGet server "1854"
 	doGet server "1855"
 	doGet server "1856"
 	doGet server "1857"
 	doGet server "1858"
 	doGet server "1859"
  
	Single.disconnect server
	U.putStrLn ("*** 終了***")
	where
		doGet server key = 
			R.get server key >>= maybe (U.putStrLn ("Non existen key: " ++ key ++ ".")) U.putStrLn
		print_action f = f >>= maybe (U.putStrLn "something is wrong") U.putStrLn
		print_int action val = U.putStrLn (action ++ ": " ++ show val ++ ".")
-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
