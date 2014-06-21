-- -------------------------------------------------------------------
--	notyet_haskell_read.hs
-- -------------------------------------------------------------------
import System.IO.UTF8 as U
-- -------------------------------------------------------------------
main = do
	U.putStrLn "Content-type: text/json\n\n"

	U.putStr "{\"cities\":[{\"id\": \"1421\",\"name\": \"Yokohama\",\"population\":\"90345\",\"date_mod\":\"1990-03-02\"},"
--	U.putStr "{\"cities\":[{\"id\": \"1421\",\"name\": \"横浜\",\"population\":\"90345\",\"date_mod\":\"1990-03-02\"},"
	U.putStr "{\"id\":\"1422\",\"name\":\"Kawasaki\",\"population\":\"15345\",\"date_mod\":\"1990-01-05\"},"
--	U.putStr "{\"id\":\"1422\",\"name\":\"川崎\",\"population\":\"15345\",\"date_mod\":\"1990-01-05\"},"
	U.putStr "{\"id\":\"1423\",\"name\":\"Odawara\",\"population\":\"16345\",\"date_mod\":\"1990-01-17\"},"
--	U.putStr "{\"id\":\"1423\",\"name\":\"小田原\",\"population\":\"16345\",\"date_mod\":\"1990-01-17\"},"
	U.putStr "{\"id\":\"1424\",\"name\":\"Fujisawa\",\"population\":\"90345\",\"date_mod\":\"1990-02-09\"},"
--	U.putStr "{\"id\":\"1424\",\"name\":\"藤沢\",\"population\":\"90345\",\"date_mod\":\"1990-02-09\"},"
	U.putStr "{\"id\":\"1425\",\"name\":\"Sagamihara\",\"population\":\"90345\",\"date_mod\":\"1990-02-22\"},"
--	U.putStr "{\"id\":\"1425\",\"name\":\"相模原\",\"population\":\"90345\",\"date_mod\":\"1990-02-22\"},"
	U.putStr "{\"id\":\"1426\",\"name\":\"Atsugi\",\"population\":\"1009345\",\"date_mod\":\"1990-02-14\"}]}"
--	U.putStr "{\"id\":\"1426\",\"name\":\"厚木\",\"population\":\"1009345\",\"date_mod\":\"1990-02-14\"}]}"
-- -------------------------------------------------------------------
