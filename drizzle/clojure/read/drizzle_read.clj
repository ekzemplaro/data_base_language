; -----------------------------------------------------------------
;
;	drizzle_read.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
(println "*** 開始 ***")

(let [db-host "localhost:4427" db-name "city"]
	(def db {:classname "org.drizzle.jdbc.DrizzleDriver"
		:subprotocol "drizzle"
		:subname (str "//" db-host "/" db-name)
		:user "scott"
		:password "tiger"})
	(with-connection db
		(with-query-results rs
		["select id,name,population,date_mod from cities"]
			(display_proc rs)
		)
	))
(println "*** 終了 ***")
; -----------------------------------------------------------------
