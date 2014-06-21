; -------------------------------------------------------------------
;
;	sqlite3_delete.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar id_in)
(defvar command)

(setf key_in (nth 6 *command-line-argument-list*))

(format t "~a%" key_in)
(setf command (format nil
	"delete from cities where ID='~a'" key_in))
(format t "~a~%" command)
;
(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
(require :asdf)
(require :clsql-sqlite3)
(clsql:connect '("/var/tmp/sqlite3/cities.db") :database-type :sqlite3)
(clsql:status)
(format t "~%")
(clsql:execute-command command) 
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
