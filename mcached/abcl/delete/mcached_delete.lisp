; -------------------------------------------------------------------
;
;	mcached_delete.lisp
;
;						May/07/2013
;
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(require :asdf)
(require :usocket)
(setf key_in (car *command-line-argument-list*))
(format t "~a~%" key_in)
(setf command (format nil
	"delete ~a~c~c" key_in #\Cr #\Lf))
(format t "~a~%" command)
(setf port 11211)
(usocket:with-client-socket
	(socket stream "localhost" port)
	(format stream command)
	)
(format t "*** 終了 ***~%")
(quit)
; -------------------------------------------------------------------
