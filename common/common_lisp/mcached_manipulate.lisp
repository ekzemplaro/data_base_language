; -------------------------------------------------------------------
;
;	common_lisp/mcached_manipulate.lisp
;
;						Jan/10/2014
; -------------------------------------------------------------------
; [4-4-2]:
(defun display_record_proc_s2 (key_in line_in)
(let (
	(unit_aa (with-input-from-string (s line_in) (json:decode-json s)))
	)
	(let (
		(name (cdr (assoc :name unit_aa)))
		(population (cdr (assoc :population unit_aa)))
		(date_mod (cdr (assoc :date--mod unit_aa)))
		)
	(format t "~a	~a	~a	~a~%" key_in name population date_mod)
		)
	)
)

; -------------------------------------------------------------------
; [4-4]:
(defun display_record_proc (key_in line_in)
	(if (string/= line_in "VALUE" :start1 0 :end1 4 :start2 0 :end2 4)
		(display_record_proc_s2 key_in line_in)
	)
)
; -------------------------------------------------------------------
; [4]:
(defun socket_read_proc (stream key)
	(format stream "get ~a~c~c" key #\Cr #\Lf)
	(force-output stream)
	(loop for line = (read-line stream nil nil)
		while (string/= line "END" :start1 0 :end1 2 :start2 0 :end2 2)
		do (display_record_proc key line))
)

; -------------------------------------------------------------------
; [6-4]:
(defun socket_write_proc (stream key json_str)
;	(format t "~a~%" key)
;	(format t "~a~%" json_str)
;	(format t "~a~%" (length json_str))
;
	(format stream "set ~a 0 0 ~a~c~c" key (length json_str) #\Cr #\Lf)
	(format stream "~a~c~c" json_str #\Cr #\Lf)
	(force-output stream)
	(loop for line = (read-line stream nil nil)
;;		while (string/= line "END" :start1 0 :end1 2 :start2 0 :end2 2)
		while (string/= line "STORED" :start1 0 :end1 5 :start2 0 :end2 5)
		do (print line))
;
)

; -------------------------------------------------------------------
; [6]:
(defun socket_single_write_proc (stream key value)
	(let (
	(name (gethash 'name value))
	(population (gethash 'population value))
	(date_mod (gethash 'date_mod value))
		)
;	(format t "~a	~a	~a	~a~%" key name population date_mod)

	(let (
		(unit_aa (make-hash-table))
		)
	(setf (gethash 'name unit_aa) name) 
	(setf (gethash 'population unit_aa) population)
	(setf (gethash 'date_mod unit_aa) date_mod)

(let (
		(json_str_new (json:encode-json-to-string unit_aa))
		)
	(format t "~a~%" json_str_new)
	(socket_write_proc stream key json_str_new)
		)
	)
	)
)

; -------------------------------------------------------------------
; [8-4-2]:
(defun update_exec_proc_s2 (stream key_in population_in str_json)
(let (
	(unit_aa (with-input-from-string (s str_json) (json:decode-json s)))
	)
(let (
(name (cdr (assoc :name unit_aa)))
(population (cdr (assoc :population unit_aa)))
(date_mod (cdr (assoc :date--mod unit_aa)))
(today (get_current_date_proc))
	)
(format t "~a	~a	~a	~a~%" key_in name population date_mod)
(format t "~a	~a	~a	~a~%" key_in name population_in today)
(setf (cdr (assoc :population unit_aa)) population_in)
(setf (cdr (assoc :date--mod unit_aa)) today)
	(let (
		(json_str_new (json:encode-json-to-string unit_aa))
		)
	(format t "~a~%" json_str_new)
	(socket_write_proc stream key_in json_str_new)
		)
		)
)
)
; -------------------------------------------------------------------
; [8-4]:
(defun update_exec_proc (stream key population line)
	(format t "update_exec_proc	~a~%" line)
	(if (string/= line "VALUE" :start1 0 :end1 4 :start2 0 :end2 4)
		(update_exec_proc_s2 stream key population line)
	)
)
; -------------------------------------------------------------------
; [8]:
(defun socket_update_proc (stream key population_in)
	(let	( 
		(json_str "")
		)
	(format stream "get ~a~c~c" key #\Cr #\Lf)
	(force-output stream)
	(loop for line = (read-line stream nil nil)
		while (string/= line "END" :start1 0 :end1 2 :start2 0 :end2 2)
		do (setf json_str line)
;
	)
	(format t "~a~%" json_str)
	(update_exec_proc stream key population_in json_str)
;
	)
)

; -------------------------------------------------------------------
