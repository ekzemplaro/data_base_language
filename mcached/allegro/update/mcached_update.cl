; -------------------------------------------------------------------
;
;	mcached_update.cl
;
;						Jan/14/2014
; -------------------------------------------------------------------
(require :asdf)
(asdf:load-system :usocket)
(asdf:load-system :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar population_in)
(setf key_in (cadr (system:command-line-arguments)))
(setf population_in (caddr (system:command-line-arguments)))
(format t "~a ~a~%" key_in population_in)

(usocket:with-client-socket (socket stream "localhost" 11211)
	(socket_update_proc stream key_in population_in)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

