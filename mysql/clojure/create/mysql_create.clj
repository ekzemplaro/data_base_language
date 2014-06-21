; -----------------------------------------------------------------
;
;	mysql_create.clj
;
;					Jul/03/2011
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
; -----------------------------------------------------------------
(defn insert_proc []
	(insert-values :cities
	[:id :name :population :date_mod] ["t3321" "岡山" 73251 "1970-9-19"])
	(insert-values :cities
	[:id :name :population :date_mod] ["t3322" "倉敷" 31462 "1970-8-9"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3323" "津山" 75847 "1970-3-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3324" "玉野" 42938 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3325" "笠岡" 36428 "1970-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3326" "井原" 42519 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3327" "総社" 82328 "1970-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3328" "高梁" 91636 "1970-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3329" "新見" 43517 "1970-9-17"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "host_mysql"
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
