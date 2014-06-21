; -----------------------------------------------------------------
;
;	oracle_create.clj
;
;					Sep/29/2010
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
; -----------------------------------------------------------------
(defn insert_proc []
    (insert-values :cities
        [:id :name :population :date_mod] [131 "函館" 34200 "1991-8-14"])
    (insert-values :cities
        [:id :name :population :date_mod] [132 "札幌" 71400 "1991-5-23"])
    (insert-values :cities
        [:id :name :population :date_mod] [133 "帯広" 21700 "1991-9-15"])
    (insert-values :citie
        [:id :name :population :date_mod] [134 "釧路" 52900 "1991-11-21"])
    (insert-values :cities
        [:id :name :population :date_mod] [135 "旭川" 61500 "1991-10-7"])
    (insert-values :cities
        [:id :name :population :date_mod] [136 "北見" 42000 "1991-7-12"])
    (insert-values :cities
        [:id :name :population :date_mod] [137 "室蘭" 52000 "1991-2-24"])
    (insert-values :cities
        [:id :name :population :date_mod] [138 "根室" 41000 "1991-5-21"])
    (insert-values :cities
        [:id :name :population :date_mod] [139 "稚内" 73500 "1991-9-17"])
    )

; -----------------------------------------------------------------
(println "*** 開始 ***")

(let [db-host "spn109:1521"
	db-name "xe"
	]

  (def db {:classname "oracle.jdbc.driver.OracleDriver"
           :subprotocol "oracle:thin"
           :subname (str ":@" db-host "/" db-name)
           :user "scott"
           :password "tiger"})

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
