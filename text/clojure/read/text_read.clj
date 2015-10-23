; -----------------------------------------------------------------
;
;	text_read.clj
;
;					Oct/28/2013
;
; -----------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/text_manipulate.clj")
;(def ^:dynamic *default-encoding* "UTF-8")
; -----------------------------------------------------------------
(println "*** 開始 ***")
(def file_text (first *command-line-args*))
;
(def dict_aa (text_read_proc file_text))

(println (class dict_aa))
;
(dict_display_proc dict_aa)
(println "*** 終了 ***")
; ----------------------------------------------------------------
