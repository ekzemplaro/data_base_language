; -----------------------------------------------------------------
;
;	sqlite3_create.clj
;
;					Oct/27/2011
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use '[clojure.contrib.sql :only (with-connection)])
(use '[clojure.contrib.sql :only (insert-values)])
(use '[clojure.contrib.sql :only (drop-table)])
(use '[clojure.contrib.sql :only (create-table)])
(use '[clojure.contrib.str-utils :only (str-join)])
; -----------------------------------------------------------------
(defn insert_proc []
    (insert-values :cities
        [:id :name :population :date_mod] ["t0711" "郡山" 45213 "1970-1-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t0712" "会津若松" 17546 "1970-7-19"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t0713" "白河" 93274 "1970-6-5"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t0714" "福島" 42356 "1970-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t0715" "喜多方" 36714 "1970-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t0716" "二本松" 42836 "1970-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t0717" "いわき" 82972 "1970-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t0718" "相馬" 27165 "1970-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] ["t0719" "須賀川" 38716 "1970-12-15"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host ""
	db-name (first *command-line-args*)]

  (def db {:classname "org.sqlite.JDBC"
           :subprotocol "sqlite"
           :subname (str "" db-name)
           :user ""
           :password ""})

  (with-connection db
    (drop-table :cities)
    (create-table :cities
      [:id :int "PRIMARY KEY"]
      [:name :varchar]
      [:population :int]
      [:date_mod :date])
    (insert_proc)
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
