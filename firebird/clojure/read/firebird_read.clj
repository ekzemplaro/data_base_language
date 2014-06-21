; -----------------------------------------------------------------
;
;	firebird_read.clj
;
;					Feb/17/2011
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.contrib.sql)

(println "*** 開始 ***")
(let [db-host "localhost"
      db-name "/var/tmp/firebird/cities.fdb"]

  (def db {:classname "org.firebirdsql.jdbc.FBDriver" ; must be in classpath
           :subprotocol "firebirdsql"
           :subname (str "" db-host ":" db-name)
           ; Any additional keys are passed to the driver
           ; as driver-specific properties.
           :user "sysdba"
           :password "tiger"})

	(with-connection db
		(with-query-results rs ["select * from cities"]
			(display_proc rs)
)))
(println "*** 終了 ***")
;;      (dorun (map #(println (:language :iso_code %)) rs))))) 
; -----------------------------------------------------------------
