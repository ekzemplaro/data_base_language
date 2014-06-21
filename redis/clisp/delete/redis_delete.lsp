; -------------------------------------------------------------------
;
;	redis_delete.lsp
;
;					Jan/14/2014
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(push #P"/usr/share/common-lisp/source/usocket/" asdf:*central-registry*)
(asdf:load-system :usocket)
; -------------------------------------------------------------------
(print "*** 開始 ***")

(defvar key_in)
(defvar command)

(setf key_in (car *args*))

(format t "~a~%" key_in)
(setf command (format nil
	"del ~a~c~c" key_in #\Cr #\Lf))
(format t "~a~%" command)
;
(usocket:with-client-socket
	(socket stream "host_dbase" 6379)
	(format stream command)
	)

(print "*** 終了 ***")
; -------------------------------------------------------------------
