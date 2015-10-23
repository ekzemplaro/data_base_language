; -------------------------------------------------------------------
;
;	common_lisp/file_io.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(defun file_to_str (file_in)
(let (
	(str_in (with-open-file (s file_in :direction :input)
	(let ((buf (make-string (file-length s))))
		(read-sequence buf s)
		buf))
	)
	)
	str_in
)
)

; -------------------------------------------------------------------
