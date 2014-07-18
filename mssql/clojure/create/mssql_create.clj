; -----------------------------------------------------------------
;
;	mssql_create.clj
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
        [:id :name :population :date_mod] ["t1071" "前橋" 98732 "1970-4-22"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t1072" "高崎" 31456 "1970-7-19"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t1073" "桐生" 65182 "1970-5-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t1074" "沼田" 42971 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t1075" "伊勢崎" 86513 "1970-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t1076" "水上" 41672 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t1077" "太田" 82547 "1970-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t1078" "安中" 74298 "1970-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t1079" "みどり" 43596 "1970-9-17"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "host_mssql;"
	db-name "databaseName=city"]

  (def db {:classname "com.microsoft.sqlserver.jdbc.SQLServerDriver"
           :subprotocol "sqlserver"
           :subname (str "//" db-host db-name)
           :user "sa"
           :password "scott_tiger"})

  (with-connection db
	(drop-table :cities)
	(create-table :cities
		[:id "varchar(10)" "PRIMARY KEY"]
		[:name "nvarchar(20)"]
		[:population :int]
		[:date_mod :datetime])
	(insert_proc)
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
