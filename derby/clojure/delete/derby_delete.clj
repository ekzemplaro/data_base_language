; -----------------------------------------------------------------
;
;	derby_delete.clj
;
;					Oct/01/2012
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "city_aaa;create=true"
	id (first *command-line-args*)
	population (second *command-line-args*)
	today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))
	]
(println id)
(println population)
(println today)

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
