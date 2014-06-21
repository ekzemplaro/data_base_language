;;; -----------------------------------------------------------
;;;	text_update.el
;;;
;;;					Aug/09/2011
;;;
;;; -----------------------------------------------------------
(setq load-path (append (list nil "/var/www/data_base/common/elisp_common") load-path))
(load "text_manipulate")
;;; -----------------------------------------------------------
(princ "*** 開始 ***\n")
(setq file_text (car argv))
(setq key (nth 1 argv))
(setq population_in (nth 2 argv))
(princ file_text)
(princ "\t")
(princ key)
(princ "\t")
(princ population_in)
(princ "\n")
;
(setq dict_aa (text_read_proc file_text))
(dict_update_proc dict_aa key population_in)
(dict_display_proc dict_aa)
(text_write_proc file_text dict_aa)
(princ "*** 終了 ***\n")
;;; -----------------------------------------------------------
