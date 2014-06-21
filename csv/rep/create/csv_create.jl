;; ---------------------------------------------------------------------
;;	csv_create.jl
;;
;;					Jun/06/2013
;;
;; --------------------------------------------------------------------
(require 'tables)
(load-file "/var/www/data_base/common/rep_common/text_manipulate.jl")
;; --------------------------------------------------------------------

;; --------------------------------------------------------------------
(defun data_prepare_proc ()
	(setq dict_aa (make-table string-hash string=))
;
	(dict_append_proc dict_aa "t1271" "千葉" "78361" "1930-8-17")
	(dict_append_proc dict_aa "t1272" "勝浦" "41657" "1930-10-21")
	(dict_append_proc dict_aa "t1273" "市原" "94523" "1930-5-16")
	(dict_append_proc dict_aa "t1274" "流山" "51482" "1930-9-23")
	(dict_append_proc dict_aa "t1275" "八千代" "47851" "1930-8-9")
	(dict_append_proc dict_aa "t1276" "我孫子" "82753" "1930-5-19")
	(dict_append_proc dict_aa "t1277" "鴨川" "51748" "1930-9-12")
	(dict_append_proc dict_aa "t1278" "銚子" "23689" "1930-1-18")
	(dict_append_proc dict_aa "t1279" "市川" "91543" "1930-5-15")
)

;; --------------------------------------------------------------------
(format t "*** 開始 ***")
(setq file_out (cadr command-line-args))
(format t file_out)

(setq dict_aa (data_prepare_proc))
(table-walk dict_display_proc_single dict_aa)

(csv_write_proc file_out dict_aa)

(format t "*** 終了 ***")


;; ---------------------------------------------------------------------
