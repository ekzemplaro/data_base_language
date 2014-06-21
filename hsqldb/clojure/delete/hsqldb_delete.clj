; -----------------------------------------------------------------
;
;	hsqldb_delete.clj
;
;					Aug/24/2010
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
(println "*** 開始 ***")

(let [db-host "file"
	db-name "/var/tmp/hsqldb/cities;shutdown=true"
	id (first *command-line-args*)
	population (second *command-line-args*)
	today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))
	]
(println id)
(println population)
(println today)

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
