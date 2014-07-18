; -----------------------------------------------------------------
;
;	h2_create.clj
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
        [:id :name :population :date_mod] ["t4561" "宮崎" 71267 "1970-4-23"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4562" "日南" 25981 "1970-7-9"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4563" "延岡" 75246 "1970-3-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4564" "都城" 42891 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4565" "小林" 36418 "1970-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4566" "日向" 42736 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4567" "串間" 82175 "1970-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4568" "西都" 81349 "1970-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4569" "えびの" 42781 "1970-9-11"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "file"
	db-name "/var/tmp/h2/cities"]

  (def db {:classname "org.h2.Driver"
           :subprotocol "h2"
           :subname (str db-host ":" db-name)
           :user "SA"
           :password ""})

  (with-connection db
	(drop-table :cities)
	(create-table :cities
		[:id "varchar(10)" "PRIMARY KEY"]
		[:name :varchar]
		[:population :int]
		[:date_mod :date])
	(insert_proc)
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
