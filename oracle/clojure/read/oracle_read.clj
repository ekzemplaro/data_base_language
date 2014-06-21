; -----------------------------------------------------------------
;
;	oracle_read.clj
;
;					Feb/17/2011
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.contrib.sql)
(println "*** 開始 ***")

(let [db-host "spn109:1521"
      db-name "xe"]

(def db {:classname "oracle.jdbc.driver.OracleDriver"
	:subprotocol "oracle:thin"
	:subname (str ":@" db-host "/" db-name)
	:user "scott"
	:password "tiger"})

	(with-connection db
		(with-query-results rs
		["select id,name,population,date_mod from cities"]
		(display_proc rs)
))) 
(println "*** 終了 ***")
; -----------------------------------------------------------------
