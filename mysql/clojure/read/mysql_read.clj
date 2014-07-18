; -----------------------------------------------------------------
;
;	mysql_read.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
(println "*** 開始 ***")

(let [db-host "host_mysql" db-name "city"]
	(def db {:classname "org.gjt.mm.mysql.Driver"
		:subprotocol "mysql"
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
