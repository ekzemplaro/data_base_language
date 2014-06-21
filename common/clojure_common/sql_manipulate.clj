; -----------------------------------------------------------------
;
;	clojure_common/sql_manipulate.clj
;
;					Oct/28/2013
;
; -----------------------------------------------------------------
;(use '[clojure.contrib.str-utils :only (str-join)])

; -----------------------------------------------------------------
(defn display_proc [rs]
;	(println (type rs))
;	(dorun (map #(println (:language :iso_code %)) rs))
;
	(doseq [unit rs]
		(print (clojure.string/join "\t" [(unit :id)
			(unit  :name) (unit :population) (unit :date_mod)]))
		(newline)
		)
;	(println (type rs))
)

; -----------------------------------------------------------------
