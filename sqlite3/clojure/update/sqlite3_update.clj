; -----------------------------------------------------------------
;
;	sqlite3_update.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host ""
	db-name (first *command-line-args*)
	id (second *command-line-args*)
	population (second (rest *command-line-args*))
	today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))
	]
(println id)
(println population)
(println today)

  (def db {:classname "org.sqlite.JDBC"
           :subprotocol "sqlite" :subname (str "" db-name)
           :user "" :password ""})

  (with-connection db
    (update-values :cities ["id=?" id]
	{:population population :date_mod today})
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
