; -----------------------------------------------------------------
;
;	derby_read.clj
;
;					Jul/17/2014
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/sql_manipulate.clj")

; -----------------------------------------------------------------
(use 'clojure.java.jdbc)
;
(println "*** 開始 ***")

(let [db-host "localhost"
	db-name "city_aaa;create=true"]

(def db {:classname "org.apache.derby.jdbc.ClientDriver"
		:subprotocol "derby"
		:subname (str "//" db-host "/" db-name)
		})

(with-connection db
	(with-query-results rs ["select * from cities"]
	(display_proc rs)
))) 

(println "*** 終了 ***")
; -----------------------------------------------------------------
