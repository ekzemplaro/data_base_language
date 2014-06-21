; -----------------------------------------------------------------
;
;	csv_read.clj
;
;					Oct/27/2011
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/text_manipulate.clj")
; -----------------------------------------------------------------
(println "*** 開始 ***")
(def file_text (first *command-line-args*))
;
(def dict_aa (csv_read_proc file_text))

(println (class dict_aa))
;
(dict_display_proc dict_aa)
(println "*** 終了 ***")
; ----------------------------------------------------------------
