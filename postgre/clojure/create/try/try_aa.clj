; -----------------------------------------------------------------
;
;	postgre_create.clj
;
;					Sep/17/2010
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
(use 'clj-time.core)
; -----------------------------------------------------------------
(defn insert_proc []
;(let 	[today "1971-3-25"]
;(let 	[today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))]
(let 	[today (new Date)]
    (insert-values :cities
	[:id :name :population :date_mod]
	 [3461 "広島" 54200 (date-time 1971 3 12)])
    )
)

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "city"
	]

  (def db {:classname "org.postgresql.Driver"
           :subprotocol "postgresql"
           :subname (str "//" db-host "/" db-name)
           :user "uchida"
           :password "hello9"})

  (with-connection db
    (drop-table :cities)
    (create-table :cities
      [:id :int "PRIMARY KEY"]
      [:name :varchar]
      [:population :int]
      [:date_mod :date])
;      [:date_mod :varchar])
    (insert_proc)
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
