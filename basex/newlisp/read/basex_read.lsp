#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	basex_read.lsp
;
;						Jul/26/2012
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
(setf url_in "http://admin:admin@localhost:8984/rest/cities?query=/")
;(setf url_in "http://localhost:8086/exist/rest/cities/cities.xml")
(setf xml (get-url url_in))
(println xml)
(xml-type-tags nil nil nil nil)
;
(setf sxml (xml-parse xml 15))
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
