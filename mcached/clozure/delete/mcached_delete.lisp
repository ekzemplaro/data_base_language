; -------------------------------------------------------------------
;
;	mcached_delete.lisp
;
;						Jan/16/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :usocket)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
;
(setf key_in (nth 6 *command-line-argument-list*))
(format t "~a~%" key_in)
(defvar command) 
(setf command (format nil
	"delete ~a~c~c" key_in #\return #\linefeed))
(format t "~a~%" command)
(defvar hostname)
(defvar port)
(setf hostname "localhost")
(setf port 11211)
(usocket:with-client-socket
	(socket stream hostname port)
	(format stream command)
	)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
