; -----------------------------------------------------------------
;
;	mssql_delete.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "host_mssql;"
	db-name "databaseName=city"
	id (first *command-line-args*)
	]
(println id)

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
