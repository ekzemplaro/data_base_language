; -----------------------------------------------------------------
;
;	h2_update.clj
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
	db-name "/var/tmp/h2/cities"
	id (first *command-line-args*)
	population (second *command-line-args*)
	today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))
	]
(println id)
(println population)
(println today)

  (def db {:classname "org.h2.Driver"
           :subprotocol "h2"
           :subname (str db-host ":" db-name)
           :user "SA"
           :password ""})

  (with-connection db
    (update-values :cities ["id=?" id]
	{:population population :date_mod today})
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
