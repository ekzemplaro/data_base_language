;;; -----------------------------------------------------------
;;;	postgre_delete.el
;;;
;;;					Feb/25/2011
;;;
;;; -----------------------------------------------------------
(setq load-path (append (list nil "/var/www/data_base/common/elisp_common/lib") load-path))
(load "pg")

;;; -----------------------------------------------------------
(defun postgre_delete_proc (id_in)
	(princ "*** postgre_delete_proc ***\n")
	(setf command (concat "delete from cities where id=" id_in))
	(print command)
    (let* ((conn (pg:connect "city" "scott" "tiger"))
	(res (pg:exec conn command)))
      (message "status is %s"   (pg:result res :status))
      (message "metadata is %s" (pg:result res :attributes))
      (message "data is %s"     (pg:result res :tuples))
      (pg:disconnect conn)))

;;; -----------------------------------------------------------
(princ "*** 開始 ***\n")
(print argv)
(setf id_in (car argv))
(print id_in)
(setf argv nil)
(postgre_delete_proc id_in)
(princ "*** 終了 ***\n")
;;; -----------------------------------------------------------
