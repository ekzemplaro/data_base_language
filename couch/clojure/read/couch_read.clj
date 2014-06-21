; -----------------------------------------------------------------------
;
;	couch_read.clj
;
;						Jul/03/2011
; -----------------------------------------------------------------------
(use '[clojure.contrib.json.read])
(use '[clojure.contrib.duck-streams])
(use '[clojure.contrib.str-utils :only (re-split)])
(use '[clojure.contrib.str-utils :only (str-join)])
(load-file "/var/www/data_base/common/clojure_common/text_manipulate.clj")
; -----------------------------------------------------------------
(defn sub01 [key_aa unit_aa]
;	(println key_aa)
	(def unit_body (second unit_aa))
	(def name_aa (unit_body "name"))
	(def population (unit_body "population"))
	(def date_mod (unit_body "date_mod"))
	(println (str-join "\t" [key_aa name_aa population date_mod]))
)
; -----------------------------------------------------------------
(println "*** 開始 ***")
(def uri "http://cdbd026:5984/city/cities")
;(def str_json (slurp uri))
;(println str_json)
(def str_json "")
(doseq [line (read-lines uri)] 
	(def str_json (str str_json line))
)
;
(def dict_aa (read-json str_json))
;
(doseq [unit_aa dict_aa]
	(def key_aa (first unit_aa))
	(if (not (= key_aa "_id"))
		(if (not (= key_aa "_rev"))
			(sub01 key_aa unit_aa)
		)
	)
)
;)
;
;(println str_json)
(println (type dict_aa))
(println "*** 終了 ***")
; -----------------------------------------------------------------------
