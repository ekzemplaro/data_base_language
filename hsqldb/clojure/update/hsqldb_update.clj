; -----------------------------------------------------------------
;
;	hsqldb_update.clj
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
    (update-values :cities ["id=?" id]
	{:population population :date_mod today})
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
