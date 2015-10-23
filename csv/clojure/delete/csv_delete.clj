; -----------------------------------------------------------------
;
;	csv_delete.clj
;
;					Oct/27/2011
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/text_manipulate.clj")
; -----------------------------------------------------------------
(println "*** 開始 ***")
(def file_text (first *command-line-args*))
(def id_in (second *command-line-args*))
(def key_in (keyword id_in))
(println file_text)
(println id_in)
;
(def dict_aa (csv_read_proc file_text))

(def dict_aa (dissoc dict_aa key_in))

(csv_write_proc file_text dict_aa)
(dict_display_proc dict_aa)
;
(println "*** 終了 ***")
; -----------------------------------------------------------------
