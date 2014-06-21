; -----------------------------------------------------------------
;
;	hsqldb_read.clj
;
;					Feb/17/2011
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.contrib.sql)
(println "*** 開始 ***")

(let [db-host "file"
      db-name "/var/tmp/hsqldb/cities;shutdown=true"]

	(def db {:classname "org.hsqldb.jdbcDriver"
           :subprotocol "hsqldb"
           :subname (str db-host ":" db-name)
           :user "SA"
           :password ""})

(with-connection db
	(with-query-results rs ["select * from cities"]
		(display_proc rs)
)))
;		(dorun (map #(println (:language :iso_code %)) rs))))) 
(println "*** 終了 ***")
; -----------------------------------------------------------------
