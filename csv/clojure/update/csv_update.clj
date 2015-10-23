; -----------------------------------------------------------------
;
;	csv_update.clj
;
;					Oct/27/2011
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/text_manipulate.clj")
; -----------------------------------------------------------------
(println "*** 開始 ***")
(def file_text (first *command-line-args*))
(def id_in (second *command-line-args*))
(def population_in (second (rest *command-line-args*)))
(def key_in (keyword id_in))
(println file_text)
(print id_in)
(print "\t")
(println population_in)
;
(def dict_aa (csv_read_proc file_text))

(def dict_aa (assoc dict_aa key_in (new_unit_gen_proc dict_aa key_in population_in)))

(csv_write_proc file_text dict_aa)
(dict_display_proc dict_aa)
;
(println "*** 終了 ***")
; -----------------------------------------------------------------
