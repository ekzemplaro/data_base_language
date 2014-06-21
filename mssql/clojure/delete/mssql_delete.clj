; -----------------------------------------------------------------
;
;	mssql_delete.clj
;
;					Jan/17/2013
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
(println "*** 開始 ***")

(let [db-host "host_mssql;"
	db-name "databaseName=city"
	id (first *command-line-args*)
	population (second *command-line-args*)
	today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))
	]
(println id)
(println population)
(println today)

  (def db {:classname "com.microsoft.sqlserver.jdbc.SQLServerDriver" 
           :subprotocol "sqlserver"
           :subname (str "//" db-host db-name)
           :user "sa"
           :password "scott_tiger"})

(with-connection db
	(delete-rows :cities ["id=?" id])
		))
(println "*** 終了 ***")
; -----------------------------------------------------------------
