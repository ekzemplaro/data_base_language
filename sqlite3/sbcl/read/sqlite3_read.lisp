#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	sqlite3_read.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(require :asdf)
(require :clsql-sqlite3)
(clsql:connect '("/var/tmp/sqlite3/cities.db") :database-type :sqlite3)
(clsql:status)
(format t "~%")
;
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
