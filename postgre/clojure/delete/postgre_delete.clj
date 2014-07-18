; -----------------------------------------------------------------
;
;	postgre_delete.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "city"
	id (first *command-line-args*)
	]
(println id)

  (def db {:classname "org.postgresql.Driver"
           :subprotocol "postgresql"
           :subname (str "//" db-host "/" db-name)
           :user "scott"
           :password "tiger"})

  (with-connection db
    (delete-rows :cities ["id=?" id])
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
