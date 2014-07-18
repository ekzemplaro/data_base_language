; -----------------------------------------------------------------
;
;	h2_read.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "file"
      db-name "/var/tmp/h2/cities"]

(def db {:classname "org.h2.Driver"
           :subprotocol "h2"
           :subname (str db-host ":" db-name)
           ; Any additional keys are passed to the driver
           ; as driver-specific properties.
           :user "SA"
           :password ""})

(with-connection db
	(with-query-results rs
		["select id,name,population,date_mod from cities"]
			(display_proc rs)
))) 
(println "*** 終了 ***")
; -----------------------------------------------------------------
