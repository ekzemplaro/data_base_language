; -----------------------------------------------------------------
;
;	hsqldb_delete.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "file"
	db-name "/var/tmp/hsqldb/cities;shutdown=true"
	id (first *command-line-args*)
	]
(println id)

  (def db {:classname "org.hsqldb.jdbcDriver"
           :subprotocol "hsqldb"
           :subname (str db-host ":" db-name)
           :user "SA"
           :password ""})

  (with-connection db
    (delete-rows :cities ["id=?" id])
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
