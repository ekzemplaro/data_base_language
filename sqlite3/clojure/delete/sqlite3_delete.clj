; -----------------------------------------------------------------
;
;	sqlite3_delete.clj
;
;					Aug/06/2010
;
; -----------------------------------------------------------------
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
(println "*** 開始 ***")

(let [db-host ""
	db-name (first *command-line-args*)
	id (second *command-line-args*)
	]
(println id)

  (def db {:classname "org.sqlite.JDBC"
           :subprotocol "sqlite" :subname (str "" db-name)
           :user "" :password ""})

  (with-connection db
    (delete-rows :cities ["id=?" id])
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
