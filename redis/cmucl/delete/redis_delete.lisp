; -------------------------------------------------------------------
;
;	redis_delete.lisp
;
;						Jan/16/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :usocket)
;
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar command)

(setf key_in (car *command-line-application-arguments*))

(format t "~a~%" key_in)
(setf command (format nil
	"del ~a~c~c" key_in #\Cr #\Lf))
(format t "~a~%" command)
;
(usocket:with-client-socket
	(socket stream "host_dbase" 6379)
	(format stream command)
	)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
