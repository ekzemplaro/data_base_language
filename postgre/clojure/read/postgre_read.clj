; -----------------------------------------------------------------
;
;	postgre_read.clj
;
;					Feb/17/2011
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.contrib.sql)
(println "*** 開始 ***")
(let [db-host "localhost"
      db-name "city"]

  (def db {:classname "org.postgresql.Driver" ; must be in classpath
           :subprotocol "postgresql"
           :subname (str "//" db-host "/" db-name)
           ; Any additional keys are passed to the driver
           ; as driver-specific properties.
           :user "scott"
           :password "tiger"})

  (with-connection db
    (with-query-results rs ["select * from cities order by id"]
		(display_proc rs)
)))
(println "*** 終了 ***")
;      (dorun (map #(println (:language :iso_code %)) rs))))) 
; -----------------------------------------------------------------
