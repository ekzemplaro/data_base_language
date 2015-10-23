; -------------------------------------------------------------------
;
;	common_lisp/json_manipulate.lisp
;
;						Jan/07/2014
;
; -------------------------------------------------------------------
(defun json_write_proc_single (key value)
	(let (
		(out_str "")
		(s0 (gethash 'name value))
		(s1 (gethash 'population value))
		(s2 (gethash 'date_mod value))
		)
	(setf out_str (concatenate 'string out_str
		(format nil "\"~a\":" key )))
	(setf out_str (concatenate 'string out_str
		(format nil "{\"name\": \"~a\"," s0)))
	(setf out_str (concatenate 'string out_str
		(format nil "\"population\": ~a," s1)))
	(concatenate 'string out_str
		(format nil "\"date_mod\": \"~a\"},~%" s2))
;
;	(format t out_str)
)
)

; -------------------------------------------------------------------
(defun json_write_proc (file_out hash_in)
	(let (
		(out_str "")
;
	(stream (open file_out :direction :output :if-exists :supersede))
		)
	(format stream "{~%")
	(maphash #'(lambda (key value)
		(setf out_str (concatenate 'string out_str
			(json_write_proc_single key value)))
		) 
		hash_in)
;
	(setf (char out_str (- (length out_str) 2)) #\})
	(format stream "~a" out_str)
;
	(close stream)
	)
)

; -------------------------------------------------------------------
(defun json_display_proc (str_json)
(let (
	(dict_aa (with-input-from-string (s str_json) (json:decode-json s)))
	)
;
(dolist (row dict_aa) (
	progn 
		(let (
			(key (subseq (string (car row)) 1))
			(name (cdr (assoc :name (cdr row))))
			(population (cdr (assoc :population (cdr row))))
			(date_mod (cdr (assoc :date--mod (cdr row))))
			)
		(setf (subseq key 0 1) "t")
;
;
	(format t "~a	~a	~a	~a~%" key name population date_mod)
	))
)
)
)

; -------------------------------------------------------------------
(defun alist_update_proc (alist_aa key_in population_in)
	(let (
		(key_tmp (concatenate 'string "T-" (subseq key_in 1)))
		)
	(print key_tmp)
	(print (assoc (intern key_tmp "KEYWORD") alist_aa))
	(let (
		(row (assoc (intern key_tmp "KEYWORD") alist_aa))
		)
	(if row (
		progn
		(let (
			(name (cdr (assoc :name (cdr row))))
			(population (cdr (assoc :population (cdr row))))
			(date_mod (cdr (assoc :date--mod (cdr row))))
			)
		(format t "~a	~a	~a	~a~%" key_in name population date_mod)
		(setf (cdr (assoc :population (cdr row))) population_in)
;		(setf today (get_current_date_proc))
		(setf (cdr (assoc :date--mod (cdr row))) (get_current_date_proc))
		))
	)
)
)
)

; -------------------------------------------------------------------
(defun alist_delete_proc (alist_aa key_in)
	(let (
		(key_tmp (concatenate 'string "T-" (subseq key_in 1)))
		)
	(let (
		(kx (intern key_tmp "KEYWORD"))
		)
	(let (
		(record (assoc kx alist_aa))
		)
	(print key_tmp)
	(print record)
;
	(delete record alist_aa)
	)
	)
	)
)

; -------------------------------------------------------------------
(defun to_json_file (alist_aa file_out)
	(let (
		(stream (open file_out :direction :output :if-exists :supersede))
		)
	(json:encode-json alist_aa stream)
	(close stream)
		)
)

; -------------------------------------------------------------------
