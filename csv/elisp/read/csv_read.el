;;; -----------------------------------------------------------
;;;	csv_read.el
;;;
;;;					Aug/09/2011
;;;
;;; -----------------------------------------------------------
(setq load-path (append (list nil "/var/www/data_base/common/elisp_common") load-path))
(load "text_manipulate")
;;; -----------------------------------------------------------
(princ "*** 開始 ***\n")
(setq file_in (car argv))
(print file_in)
;
(setq dict_aa (csv_read_proc file_in))
(dict_display_proc dict_aa)
(princ "*** 終了 ***\n")
;;; -----------------------------------------------------------
