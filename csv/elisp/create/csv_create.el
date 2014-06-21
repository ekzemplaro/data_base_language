; -------------------------------------------------------------------
;;;	csv_create.el
;;;
;;;					Aug/09/2011
;;;
; -------------------------------------------------------------------
(setq load-path (append (list nil "/var/www/data_base/common/elisp_common") load-path))
(load "text_manipulate")
; -------------------------------------------------------------------
(defun dict_prepare_proc ()
	(setq dict_pp (make-hash-table :test #'equal))
	(setq dict_pp (dict_append_proc dict_pp "t1271" "千葉" "21785" "1979-5-21"))
	(setq dict_pp (dict_append_proc dict_pp "t1272" "勝浦" "54291" "1979-12-15"))
	(dict_append_proc dict_pp "t1273" "市原" "68712" "1979-10-19")
	(dict_append_proc dict_pp "t1274" "流山" "85692" "1979-2-18")
	(dict_append_proc dict_pp "t1275" "八千代" "46981" "1979-9-22")
	(dict_append_proc dict_pp "t1276" "我孫子" "98172" "1979-4-24")
	(dict_append_proc dict_pp "t1277" "鴨川" "39754" "1979-5-28")
	(dict_append_proc dict_pp "t1278" "銚子" "97345" "1979-3-9")
	(dict_append_proc dict_pp "t1279" "市川" "78921" "1979-8-15")
	dict_pp
)

; -------------------------------------------------------------------
(princ "*** 開始 ***\n")
(setq debug-on-error t)
;
(setq dict_aa (dict_prepare_proc))
; -------------------------------------------------------------------
(princ (hash-table-count dict_aa))
(princ "\n")
; -------------------------------------------------------------------
(dict_display_proc dict_aa)
(setq file_out (car argv))
(print file_out)
(csv_write_proc file_out dict_aa)
(princ "*** 終了 ***\n")
; -------------------------------------------------------------------
