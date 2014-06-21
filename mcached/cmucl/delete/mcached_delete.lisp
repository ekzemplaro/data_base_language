; -------------------------------------------------------------------
;
;	mcached_delete.lisp
;
;						Oct/10/2013
;
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(asdf:load-system :usocket)
(require :usocket)
;
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar command)

(setf key_in (car *command-line-application-arguments*))


(format t "~a~%" key_in)
(setf command (format nil
	"delete ~a~c~c" key_in #\Cr #\Lf))
(format t "~a~%" command)
;
(usocket:with-client-socket
	(socket stream "localhost" 11211)
	(format stream command)
	)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
