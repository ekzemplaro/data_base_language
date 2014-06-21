#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	xml_read.lsp
;
;						Jul/27/2012
;
; -------------------------------------------------------------------
(define (record_process vv)
	(begin
	(dolist (sss vv)
		(if (list? sss)
			(begin
				(print (sss 1))
				(print "\t")
				)
			(begin
				(print sss)
				(print "\t")
				)
			)
		)
	(println)
	)
)

; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_in (main-args 2))
(println file_in)
(setf xml_str (read-file file_in))
(println (string? xml_str))
(xml-type-tags nil nil nil nil)
;
(setf sxml (xml-parse (read-file file_in) 15))
;
(setf ppp (sxml 0))

(dolist (vv ppp)
	(if (list? vv)
		(record_process vv)
	)
)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
