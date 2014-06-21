; -------------------------------------------------------------------
;
;	mcached_delete.cl
;
;						Jan/14/2014
;
; -------------------------------------------------------------------
(require :asdf)
(asdf:load-system :usocket)
; -------------------------------------------------------------------
;
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar command)

(setf key_in (cadr (system:command-line-arguments)))

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
