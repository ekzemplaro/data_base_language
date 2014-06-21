; -----------------------------------------------------------------
;
;	firebird_delete.clj
;
;					May/21/2012
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "/var/tmp/firebird/cities.fdb"
	id (first *command-line-args*)
	population (second *command-line-args*)
	today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))
	]
(println id)
(println population)
(println today)

  (def db {:classname "org.firebirdsql.jdbc.FBDriver"
           :subprotocol "firebirdsql"
           :subname (str "" db-host ":" db-name)
           :user "sysdba"
           :password "tiger"})

  (with-connection db
    (delete-rows :cities ["id=?" id])
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
