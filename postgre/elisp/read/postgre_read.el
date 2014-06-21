;;; -----------------------------------------------------------
;;;	postgre_read.el
;;;
;;;					Feb/25/2011
;;;
;;; -----------------------------------------------------------
(setq load-path (append (list nil "/var/www/data_base/common/elisp_common/lib") load-path))
(load "pg")

(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8-unix)

;;; -----------------------------------------------------------
(defun postgre_read_proc ()
    (let* ((conn (pg:connect "city" "scott" "tiger"))
	(res (pg:exec conn "SELECT id,population,date_mod from cities")))
      (message "status is %s"   (pg:result res :status))
      (message "metadata is %s" (pg:result res :attributes))
      (message "data is %s"     (pg:result res :tuples))
      (pg:disconnect conn)))

;;; -----------------------------------------------------------
(princ "*** 開始 ***\n")
(print argv)
(setq argv nil)
(postgre_read_proc)
(princ "*** 終了 ***\n")
;;; -----------------------------------------------------------
