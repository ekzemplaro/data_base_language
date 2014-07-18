; -----------------------------------------------------------------
;
;	drizzle_update.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "localhost:4427"
	db-name "city"
	id (first *command-line-args*)
	population (second *command-line-args*)
	today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))
	]
(println id)
(println population)
(println today)

  (def db {:classname "org.drizzle.jdbc.DrizzleDriver"
           :subprotocol "drizzle"
           :subname (str "//" db-host "/" db-name)
           :user "scott"
           :password "tiger"})

  (with-connection db
    (update-values :cities ["id=?" id]
	{:population population :date_mod today})
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
