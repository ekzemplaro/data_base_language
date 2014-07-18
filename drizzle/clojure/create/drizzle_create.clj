; -----------------------------------------------------------------
;
;	drizzle_create.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.java.jdbc)
; -----------------------------------------------------------------
(defn insert_proc []
	(insert-values :cities
	[:id :name :population :date_mod] ["t2651" "京都" 73851 "1970-3-12"])
	(insert-values :cities
	[:id :name :population :date_mod] ["t2652" "福知山" 39462 "1970-8-9"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t2653" "舞鶴" 75827 "1970-3-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t2654" "綾部" 42975 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t2655" "宇治" 36417 "1970-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t2656" "宮津" 42589 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t2657" "亀岡" 12358 "1970-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t2658" "城陽" 91726 "1970-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t2659" "向日" 43597 "1970-9-17"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "localhost:4427"
	db-name "city"
	]

  (def db {:classname "org.drizzle.jdbc.DrizzleDriver"
           :subprotocol "drizzle"
           :subname (str "//" db-host "/" db-name)
           :user "scott"
           :password "tiger"})

  (with-connection db
	(drop-table :cities)
    (create-table :cities
      [:id "varchar(10)" "PRIMARY KEY"]
;      [:name :varchar]
      [:name :text]
      [:population :int]
      [:date_mod :text])
;      [:date_mod :varchar])
;      [:date_mod :date])
    (insert_proc)
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
