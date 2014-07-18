; -----------------------------------------------------------------
;
;	mssql_read.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")
(let [db-host "host_mssql;"
      db-name "databaseName=city"]

  (def db {:classname "com.microsoft.sqlserver.jdbc.SQLServerDriver"
           :subprotocol "sqlserver"
           :subname (str "//" db-host  db-name)
           :user "sa"
           :password "scott_tiger"})

	(with-connection db
		(with-query-results rs 
			["select id,name,population,date_mod from cities"]
			(display_proc rs)
))) 
(println "*** 終了 ***")
; -----------------------------------------------------------------
