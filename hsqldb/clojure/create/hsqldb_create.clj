; -----------------------------------------------------------------
;
;	hsqldb_create.clj
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
        [:id :name :population :date_mod] ["t4671" "鹿児島" 21736 "1971-2-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4672" "指宿" 47328 "1971-9-8"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4673" "志布志" 72391 "1971-3-15"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4674" "川内" 42869 "1971-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4675" "鹿屋" 36158 "1971-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4676" "枕崎" 42917 "1971-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4677" "出水" 82534 "1971-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4678" "阿久根" 91487 "1971-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t4679" "霧島" 46257 "1971-9-17"])
    )
; -----------------------------------------------------------------
(println" "*** 開始 ***")

(let [db-host "file"
      db-name "/var/tmp/hsqldb/cities;shutdown=true"]
         (def db {:classname "org.hsqldb.jdbcDriver"
           :subprotocol "hsqldb"
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
