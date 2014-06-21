; -----------------------------------------------------------------
;
;	firebird_create.clj
;
;					May/21/2012
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
; -----------------------------------------------------------------
(defn insert_proc []
    (insert-values :cities
        [:id :name :population :date_mod] ["t3821" "松山" 65723 "1970-8-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3822" "今治" 24589 "1970-7-9"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3823" "宇和島" 74571 "1970-3-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3824" "八幡浜" 42629 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3825" "新居浜" 36892 "1970-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3826" "西条" 42836 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3827" "大洲" 81254 "1970-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3828" "伊予" 91567 "1970-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3829" "西予" 73619 "1970-9-17"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "/var/tmp/firebird/cities.fdb"]

(def db {:classname "org.firebirdsql.jdbc.FBDriver"
	:subprotocol "firebirdsql"
	:subname (str db-host ":" db-name)
	:user "sysdba"
	:password "tiger"})

(with-connection db
	(drop-table :cities)
	(create-table :cities
		[:id "varchar(10)" "PRIMARY KEY"]
		[:name "varchar(20)"]
		[:population :int]
		[:date_mod :date])
	(insert_proc)
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
