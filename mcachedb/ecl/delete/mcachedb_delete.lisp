; -------------------------------------------------------------------
;
;	mcachedb_delete.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :usocket)
;
(format t "*** 開始 ***~%")
(format t (nth 4 (si::command-args)))
(setf key_in (nth 6 (si:command-args)))
(format t "~a~%" key_in)
(setf command (format nil
	"delete ~a~c~c" key_in #\return #\linefeed))
(format t "~a~%" command)
(setf hostname "localhost")
(setf port 21201)
;
(usocket:with-client-socket
	(socket stream hostname port)
	(format stream command)
	)
(format t "*** 終了 ***~%")
(ext:quit 0)
; -------------------------------------------------------------------
