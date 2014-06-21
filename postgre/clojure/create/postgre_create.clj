; -----------------------------------------------------------------
;
;	postgre_create.clj
;
;					Jul/16/2011
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
; -----------------------------------------------------------------
(defn insert_proc []
    (insert-values :cities
        [:id :name :population :date_mod] ["t3461" "広島" 42367 "1970-6-29"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3462" "福山" 71428 "1970-3-19"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3463" "東広島" 25392 "1970-9-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3464" "呉" 32764 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3465" "尾道" 61527 "1970-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3466" "竹原" 42781 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3467" "三次" 82592 "1970-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3468" "大竹" 91347 "1970-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3469" "府中" 43572 "1970-9-17"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "city"
	]

  (def db {:classname "org.postgresql.Driver"
           :subprotocol "postgresql"
           :subname (str "//" db-host "/" db-name)
           :user "scott"
           :password "tiger"})

  (with-connection db
    (drop-table :cities)
    (create-table :cities
      [:id "varchar(10)" "PRIMARY KEY"]
      [:name :varchar]
      [:population :int]
      [:date_mod :varchar])
;      [:date_mod :date])
    (insert_proc)
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
