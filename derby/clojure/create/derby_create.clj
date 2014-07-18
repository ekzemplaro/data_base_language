; -----------------------------------------------------------------
;
;	derby_create.clj
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
        [:id :name :population :date_mod] ["t3551" "山口" 72456 "1970-7-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3552" "下関" 37821 "1970-5-8"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3553" "萩" 85389 "1970-3-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3554" "徳山" 21567 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3555" "岩国" 36842 "1970-10-7"])
    (insert-values :cities
       [:id :name :population :date_mod] ["t3556" "光" 42915 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3557" "長門" 82137 "1970-2-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3558" "防府" 91254 "1970-5-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3559" "宇部" 52791 "1970-6-18"])
    )


; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "city_aaa;create=true"]

  (def db {:classname "org.apache.derby.jdbc.ClientDriver"
           :subprotocol "derby"
           :subname (str "//" db-host "/" db-name)
		})

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
