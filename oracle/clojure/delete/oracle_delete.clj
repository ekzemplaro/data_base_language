; -----------------------------------------------------------------
;
;	oracle_delete.clj
;
;					Sep/29/2010
;
; -----------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
(use 'clojure.contrib.sql)
(use '[clojure.contrib.str-utils :only (str-join)])
(println "*** 開始 ***")

(let [db-host "spn109:1521"
	db-name "xe"
	id (first *command-line-args*)
	population (second *command-line-args*)
	today (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date))
	]
(println id)
(println population)
(println today)

  (def db {:classname "oracle.jdbc.driver.OracleDriver"
           :subprotocol "oracle:thin"
           :subname (str ":@" db-host "/" db-name)
           :user "scott"
           :password "tiger"})

  (with-connection db
    (delete-rows :cities ["id=?" id])
      ))
(println "*** 終了 ***")
; -----------------------------------------------------------------
