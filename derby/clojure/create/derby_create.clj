; -----------------------------------------------------------------
;
;	derby_create.clj
;
;					Sep/13/2013
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])

; -----------------------------------------------------------------
(defn insert_proc []
    (insert-values :cities
        [:id :name :population :date_mod] ["t3551" "山口" 71456 "1971-7-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3552" "下関" 37823 "1971-5-8"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3553" "萩" 85381 "1971-3-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3554" "徳山" 21567 "1971-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3555" "岩国" 36842 "1971-10-7"])
    (insert-values :cities
       [:id :name :population :date_mod] ["t3556" "光" 42915 "1971-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3557" "長門" 82137 "1971-2-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3558" "防府" 91254 "1971-5-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t3559" "宇部" 52891 "1971-6-18"])
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
