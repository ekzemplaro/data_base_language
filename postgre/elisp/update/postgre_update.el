;;; -----------------------------------------------------------
;;;	postgre_update.el
;;;
;;;					Feb/25/2011
;;;
;;; -----------------------------------------------------------
(setq load-path (append (list nil "/var/www/data_base/common/elisp_common/lib") load-path))
(load "pg")

(set-language-environment "Japanese")

(set-default-coding-systems 'utf-8-unix)
;;; -----------------------------------------------------------
(defun postgre_update_proc (id_in population_in)
	(princ "*** postgre_update_proc ***\n")
	(setf today (format-time-string "%Y-%m-%d"))
	(setf command (concat "update cities set population="
		population_in ", date_mod='" today "' where id=" id_in))
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
(setf population_in (cadr argv))
(print id_in)
(print population_in)
(setf argv nil)
(postgre_update_proc id_in population_in)
(princ "*** 終了 ***\n")
;;; -----------------------------------------------------------
