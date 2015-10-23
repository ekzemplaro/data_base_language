; -------------------------------------------------------------------
;;;	text_create.el
;;;
;;;					Aug/21/2011
;;;
; -------------------------------------------------------------------
(setq load-path (append (list nil "/var/www/data_base/common/elisp_common") load-path))
(load "text_manipulate")
; -------------------------------------------------------------------
(defun dict_prepare_proc ()
	(setq dict_pp (make-hash-table :test #'equal))
	(setq dict_pp (dict_append_proc dict_pp "t2381" "名古屋" "62154" "1932-5-21"))
	(setq dict_pp (dict_append_proc dict_pp "t2382" "豊橋" "76548" "1932-12-15"))
	(dict_append_proc dict_pp "t2383" "岡崎" "68713" "1932-10-19")
	(dict_append_proc dict_pp "t2384" "一宮" "81356" "1932-2-18")
	(dict_append_proc dict_pp "t2385" "蒲郡" "46981" "1932-9-22")
	(dict_append_proc dict_pp "t2386" "常滑" "98129" "1932-4-24")
	(dict_append_proc dict_pp "t2387" "大府" "39754" "1932-5-28")
	(dict_append_proc dict_pp "t2388" "瀬戸" "97345" "1932-3-9")
	(dict_append_proc dict_pp "t2389" "犬山" "78921" "1932-8-15")
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
(text_write_proc file_out dict_aa)
(princ "*** 終了 ***\n")
; -------------------------------------------------------------------
