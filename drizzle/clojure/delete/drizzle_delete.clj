; -----------------------------------------------------------------
;
;	drizzle_delete.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "localhost:4427"
	db-name "city"
	id (first *command-line-args*)
	]
(println id)

  (def db {:classname "org.drizzle.jdbc.DrizzleDriver"
           :subprotocol "drizzle"
           :subname (str "//" db-host "/" db-name)
           :user "scott"
           :password "tiger"})

  (with-connection db
    (delete-rows :cities ["id=?" id])
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
