; -------------------------------------------------------------------
;
;	text_manipulate.cl
;
;						Aug/30/2011
;
; -------------------------------------------------------------------
(defun text_read_proc (file_in)

(defparameter dict_aa (make-hash-table :test #'equal))
;
(format t "*** text_read_proc *** start ***~%")

(with-open-file (fp_in file_in)
	(loop for line = (read-line fp_in nil nil)
	while line
		do (multiple-value-bind (id name population date_mod)
			(line_to_value_proc line #\tab)
			(setf dict_aa
			(dict_append_proc dict_aa id name population date_mod))
			)
		)
	(close fp_in)
)
dict_aa)

; -------------------------------------------------------------------
(defun dict_display_proc_single (key value)
	(setf s0 (gethash 'name value))
	(setf s1 (gethash 'population value))
	(setf s2 (gethash 'date_mod value))
	(format t "~a	~a	~a	~a~%" key s0 s1 s2)
	)
; -------------------------------------------------------------------
(defun dict_display_proc (hash)
	(format t "*** disp_proc check ***~%")
	(maphash #'(lambda (key value) (dict_display_proc_single key value)) hash)
)

; -------------------------------------------------------------------
(defun text_write_proc_single (key value)
	(setf s0 (gethash 'name value))
	(setf s1 (gethash 'population value))
	(setf s2 (gethash 'date_mod value))
	(format stream "~a	~a	~a	~a~%" key s0 s1 s2)
;	(print out_str)
)

; -------------------------------------------------------------------
(defun text_write_proc (file_out hash_in)
;	(setf stream (open file_out :direction :output))
;	(setf stream (open file_out :direction :output :if-exists :overwrite))
	(setf stream (open file_out :direction :output :if-exists :supersede))
	(format t "*** write_proc check ***~%")
	(maphash #'(lambda (key value) (text_write_proc_single key value)) hash_in)
	(close stream)
)

; -------------------------------------------------------------------
(defun dict_append_proc (dict_aa id_in name population date_mod)
;	(print "*** check *** pppp")
	(setf unit_pp (make-hash-table))
	(setf (gethash 'name unit_pp) name) 
	(setf (gethash 'population unit_pp) population)
	(setf (gethash 'date_mod unit_pp) date_mod)
	(setf (gethash id_in dict_aa) unit_pp)
;
	dict_aa)

; -------------------------------------------------------------------
(defun  line_to_value_proc (line_in delimit)
	(setf pos_aa (position delimit line_in))
;	(setf id (parse-integer (subseq line_in 0 pos_aa)))
	(setf id (subseq line_in 0 pos_aa))
;
	(setf line_bb (subseq line_in (+ pos_aa 1)))
	(setf pos_bb (position delimit line_bb))
	(setf name (subseq line_bb 0 pos_bb))
;
	(setf line_cc (subseq line_bb (+ pos_bb 1)))
	(setf pos_cc (position delimit line_cc))
	(setf population (subseq line_cc 0 pos_cc))
;
	(setf line_dd (subseq line_cc (+ pos_cc 1)))
	(setf pos_dd (position delimit line_dd))
	(setf date_mod (subseq line_dd 0 pos_dd))
;
	(values id name population date_mod)
)

; -------------------------------------------------------------------
(defun get_current_date_proc ()
	(multiple-value-bind (s m h dd mm yy)
		(decode-universal-time (get-universal-time))
		(format nil "~4,'0d-~2,'0d-~2,'0d" yy mm dd)))
; -------------------------------------------------------------------
(defun dict_update_proc (dict_aa id_in population_in)
	(multiple-value-bind (unit present) (gethash id_in dict_aa)
	(if present
		(progn
			(setf today (get_current_date_proc))
			(setf (gethash 'population unit) population_in)
			(setf (gethash 'date_mod unit) today)
			)
		)
	)
dict_aa)
; -------------------------------------------------------------------
(defun csv_read_proc (file_in)

(defparameter dict_aa (make-hash-table :test #'equal))
;
(format t "*** csv_read_proc *** start ***~%")

(with-open-file (fp_in file_in)
	(loop for line = (read-line fp_in nil nil)
	while line
		do (multiple-value-bind (id name population date_mod)
			(line_to_value_proc line #\,)
			(setf dict_aa
			(dict_append_proc dict_aa id name population date_mod))
			)
		)
	(close fp_in)
)
dict_aa)

; -------------------------------------------------------------------
(defun csv_write_proc_single (key value)
	(setf s0 (gethash 'name value))
	(setf s1 (gethash 'population value))
	(setf s2 (gethash 'date_mod value))
	(format stream "~a,~a,~a,~a~%" key s0 s1 s2)
;	(print out_str)
)

; -------------------------------------------------------------------
(defun csv_write_proc (file_out hash_in)
;	(setf stream (open file_out :direction :output))
;	(setf stream (open file_out :direction :output :if-exists :overwrite))
	(setf stream (open file_out :direction :output :if-exists :supersede))
	(format t "*** write_proc check ***~%")
	(maphash #'(lambda (key value) (csv_write_proc_single key value)) hash_in)
	(close stream)
)

; -------------------------------------------------------------------
