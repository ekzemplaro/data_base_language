;;; -----------------------------------------------------------
;;;	text_manipulate.el
;;;
;;;					Aug/09/2011
;;;
;;; -----------------------------------------------------------
(defun read_line (dict_aa delimit line)
	(setq llx (length line))
	(setq items (split-string line delimit))
	(if (> llx 0)
	(dict_append_proc dict_aa (car items) (nth 1 items) (nth 2 items) (nth 3 items))
;	(display_record_proc dict_aa items)
	)
)

;;; -----------------------------------------------------------
(defun text_read_proc_exec (file_in delimit)
(find-file file_in)
(princ-list (buffer-name))
(setq lines (split-string (buffer-string) "\n"))
(princ "*** ppp ***\n")
(setq dict_aa (make-hash-table :test #'equal))
(mapcar (lambda (xx) (read_line dict_aa delimit xx)) lines)
(princ "*** qqq ***\n")
dict_aa
)

;;; -----------------------------------------------------------
(defun text_read_proc (file_in)
(setq delimit "\t")
(text_read_proc_exec file_in delimit)
)

;;; -----------------------------------------------------------
(defun dict_append_proc (dict_bb key name_in population_in date_mod_in)
	(setq unit_pp (make-hash-table :test #'equal))
	(puthash "name" name_in unit_pp)
	(puthash "population" population_in unit_pp)
	(puthash "date_mod" date_mod_in unit_pp)
	(puthash key unit_pp dict_bb)
	dict_bb
)
; -------------------------------------------------------------------
(defun dict_display_proc (dict_aa)
	(maphash #'(lambda (key value)
		(princ key)
		(princ "\t")
		(setq pp (gethash key dict_aa))
		(princ (gethash "name" pp))
		(princ "\t")
		(princ (gethash "population" pp))
		(princ "\t")
		(princ (gethash "date_mod" pp))
		(princ "\n")
		) dict_aa)
)
; -------------------------------------------------------------------
(defun text_write_proc_exec (file_out delimit dict_aa)
(with-current-buffer (get-buffer-create "tmp_buffer"))
(erase-buffer)
(maphash #'(lambda (key value)
	(insert key)
	(insert delimit)
	(setq pp (gethash key dict_aa))
	(insert (gethash "name" pp))
	(insert delimit)
	(insert (gethash "population" pp))
	(insert delimit)
	(insert (gethash "date_mod" pp))
	(insert "\n")
	) dict_aa)
(write-region (point-min) (point-max) file_out)
)
; -------------------------------------------------------------------
(defun text_write_proc (file_out dict_aa)
(setq delimit "\t")
(text_write_proc_exec file_out delimit dict_aa)
)

; -------------------------------------------------------------------
(defun dict_update_proc (dict_aa key population_in)
(princ "*** dict_update_proc *** start ***\n")
	(princ key)
	(princ "\t")
		(setq pp (gethash key dict_aa))
		(princ (gethash "name" pp))
		(princ "\t")
		(princ (gethash "population" pp))
		(princ "\t")
		(princ (gethash "date_mod" pp))
		(princ "\n")
		(puthash "population" population_in pp)
		(setq today (format-time-string "%Y-%m-%d"))
		(puthash "date_mod" today pp)
		(puthash key pp dict_aa)
(princ "*** dict_update_proc *** end ***\n")

	dict_aa
)

; -------------------------------------------------------------------
(defun csv_read_proc (file_in)
(setq delimit ",")
(text_read_proc_exec file_in delimit)
)

;;; -----------------------------------------------------------
(defun csv_write_proc (file_out dict_aa)
(setq delimit ",")
(text_write_proc_exec file_out delimit dict_aa)
)

; -------------------------------------------------------------------
