#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	postgre_read.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(require :asdf)
(require :clsql-uffi)
(require :clsql-postgresql)
;
(format t "*** 開始 ***~%")
(clsql:connect '("localhost" "city" "scott" "tiger") :database-type :postgresql)
(clsql:status)
(format t "~%")
(mapc
	#'(lambda (lst)
;		(format t "~A~%" lst)
		(format t "~a	~a	~a	~a~%"
			(car lst) (cadr lst) (caddr lst) (nth 3 lst))
		)
		(clsql:query "select * from cities"))
;
(clsql:disconnect)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
