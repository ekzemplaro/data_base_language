; -------------------------------------------------------------------
;
;	mcached_delete.lsp
;
;						Jan/14/2014
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(push #P"/usr/share/common-lisp/source/usocket/" asdf:*central-registry*)
(asdf:load-system :usocket)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf key_in (car *args*))
(format t "~a~%" key_in)
(setf command (format nil
	"delete ~a~c~c" key_in #\return #\linefeed))
(format t "~a~%" command)
(setf hostname "localhost")
(setf port 11211)
;
(usocket:with-client-socket
	(socket stream hostname port)
	(format stream command)
	)
(format t "*** 終了 ***~%")
(ext:quit 0)
; -------------------------------------------------------------------
