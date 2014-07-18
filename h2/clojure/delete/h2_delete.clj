; -----------------------------------------------------------------
;
;	h2_delete.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "file"
	db-name "/var/tmp/h2/cities"
	id (first *command-line-args*)
	]
(println id)

  (def db {:classname "org.h2.Driver"
           :subprotocol "h2"
           :subname (str db-host ":" db-name)
           :user "SA"
           :password ""})

  (with-connection db
    (delete-rows :cities ["id=?" id])
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
