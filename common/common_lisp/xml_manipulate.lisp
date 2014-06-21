; -------------------------------------------------------------------
;
;	common_lisp/xml_manipulate.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(defun xml_write_proc_single (stream key value)
	(let (
		(s0 (gethash 'name value))
		(s1 (gethash 'population value))
		(s2 (gethash 'date_mod value))
		)
	(format stream "~%")
	(format stream "<~a>~%" key )
	(format stream "	<name>~a</name>~%" s0)
	(format stream "	<population>~a</population>~%" s1)
	(format stream "	<date_mod>~a</date_mod>~%" s2)
	(format stream "</~a>~%" key )
)
)

; -------------------------------------------------------------------
(defun xml_write_proc (file_out hash_in)
	(let (
		(stream (open file_out :direction :output :if-exists :supersede))
		)
	(format t "*** write_proc check ***~%")
	(format stream "<?xml version=\"1.0\" encoding=\"utf-8\"?>~%")
	(format stream "<root>~%")
	(maphash #'(lambda (key value) (xml_write_proc_single stream key value)) hash_in)
	(format stream "</root>~%")
	(close stream)
)
)

; -------------------------------------------------------------------
(defun xml_parse_proc (str_xml)
(let (
	(aa (xmls:parse str_xml))
	)

(let (
	(bb (cddr aa))
	)
(dolist (row bb) (
	progn
		(let (
		(key (car row))
		(value_list (cddr row))
		)
;
	(let (
		(keys_unit (mapcar #'intern (mapcar #'car value_list)))
		)
;
	(let (
		(a_list (mapcar #'cons keys_unit (mapcar #'caddr value_list)))
		)
	(let (
		(name (cdr (assoc '|name| a_list)))
		(population (cdr (assoc '|population| a_list)))
		(date_mod (cdr (assoc '|date_mod| a_list)))
		)
;
	(format t "~a	" key)
	(format t "~a	" name)
	(format t "~a	" population)
	(format t "~a~%" date_mod)
	)
)
)
)
)
)
)
)
)

; -------------------------------------------------------------------
(defun record_update_proc_exec (row_in population_in)
(let (
	(key_in (car row_in))
	(value_list (cddr row_in))
	(today (get_current_date_proc))
	)
	(let (
		(keys_unit (mapcar #'intern (mapcar #'car value_list)))
		)
	(let (
		(a_list (mapcar #'cons keys_unit (mapcar #'caddr value_list)))
		)
;
	(let (
		(name (cdr (assoc '|name| a_list)))
		)
	(let (
		(ll_aa (list "name" NIL name))
		(ll_bb (list "population" NIL population_in))
		(ll_cc (list "date_mod" NIL today))
		)
	(cons key_in (cons NIL (list ll_aa ll_bb ll_cc)))
)
)
)
)
)
)

; -------------------------------------------------------------------
(defun record_update_proc (row_in key_in population_in)
	(let (
		(key (car row_in))
		)
	(if (equal (string-upcase key_in) (string-upcase key))
		(setf row_in (record_update_proc_exec row_in population_in)))
	row_in
)
)

; -------------------------------------------------------------------
(defun xml_update_proc (str_xml key_in population_in)
(let (
		(aa (xmls:parse str_xml))
		)
	(let (
		(portion_aa (car aa))
		(portion_bb (cadr aa))
		(bb (cddr aa))
		)
;
	(let (
		(bb_new (mapcar #'(lambda (x) (record_update_proc x key_in population_in)) bb))
		)
	(let (
		(cc (cons portion_aa (cons portion_bb bb_new)))
		)
	(let (
		(str_out (xmls:toxml cc))
		)
	str_out
)
)
;
)
)
)
)
; -------------------------------------------------------------------
(defun list-if-not (pred)
 (lambda (x) (if (funcall pred x) nil (list x))))
; -------------------------------------------------------------------
(defun my-remove-if (pred lst)
 (apply #'nconc (mapcar (list-if-not pred) lst)))
; -------------------------------------------------------------------
(defun key_hantei_proc (key_in xx)
	(equal (string-upcase key_in) (string-upcase (car xx)))
)

; -------------------------------------------------------------------
(defun xml_delete_proc (xml_str key_in)
(let (
		(aa (xmls:parse xml_str))
		)
	(let (
;
	(portion_aa (car aa))
	(portion_bb (cadr aa))
	(bb (cddr aa))
	)
;
	(let (
		(bb_new (my-remove-if #'(lambda (x) (key_hantei_proc key_in x)) bb))
		)
	(let (
		(cc (cons portion_aa (cons portion_bb bb_new)))
		)
	(let (
		(str_out (xmls:toxml cc))
		)
	str_out
)
)
)
)
)
)

; -------------------------------------------------------------------
