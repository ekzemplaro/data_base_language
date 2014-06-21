; -------------------------------------------------------------------
;	newlisp_common/json_manipulate.lsp
;
;						Jan/24/2013
;
; -------------------------------------------------------------------
(define (dict_display_proc dict_aa)
	(dolist (vv dict_aa)
		(if (list? vv)
		(begin
			(print (vv 0))
			(setf sss (vv 1))
			(if (list? sss)
			(dolist (uu sss)
				(begin
					(print "\t")
					(print (uu 1))
				)
			)
			)
			(print "\n")
		)
		)
	)
)

; -------------------------------------------------------------------
