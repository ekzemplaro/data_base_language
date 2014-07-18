; -----------------------------------------------------------------
;
;	derby_delete.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "city_aaa;create=true"
	id (first *command-line-args*)
	]
(println id)

(def db {:classname "org.apache.derby.jdbc.ClientDriver"
           :subprotocol "derby"
           :subname (str "//" db-host "/" db-name)
		})
;           :user "APP"
;           :password "user1"})

(with-connection db
	(delete-rows :cities ["id=?" id])
	))
(println "*** 終了 ***")
; -----------------------------------------------------------------
