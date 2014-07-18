; -----------------------------------------------------------------
;
;	maria_create.clj
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
	[:id :name :population :date_mod] ["t3321" "岡山" 924751 "1970-5-24"])
	(insert-values :cities
	[:id :name :population :date_mod] ["t3322" "倉敷" 381462 "1970-2-18"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3323" "津山" 725841 "1970-1-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3324" "玉野" 428935 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3325" "笠岡" 396427 "1970-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3326" "井原" 432519 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3327" "総社" 142398 "1970-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3328" "高梁" 912736 "1970-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3329" "新見" 438517 "1970-9-17"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "city"
	]

  (def db {:classname "org.gjt.mm.mysql.Driver"
           :subprotocol "mysql"
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
