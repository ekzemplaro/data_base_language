; -----------------------------------------------------------------
;
;	sqlite3_read.clj
;
;					Oct/27/2011
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")
; -----------------------------------------------------------------
(use '[clojure.contrib.sql :only (with-connection)])
(use '[clojure.contrib.sql :only (with-query-results)])

(println "*** 開始 ***")

(let [db-host ""
      db-name (first *command-line-args*)]

(def db {:classname "org.sqlite.JDBC"
	:subprotocol "sqlite"
	:subname (str "" db-name)
	:user ""
	:password ""})
;
	(with-connection db
		(with-query-results rs
		["select id,name,population,date_mod from cities"]
			(display_proc rs)
))) 
(println "*** 終了 ***")
; -----------------------------------------------------------------
