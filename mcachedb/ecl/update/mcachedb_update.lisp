; -------------------------------------------------------------------
;
;	mcachedb_update.lisp
;
;						Jan/13/2014
; -------------------------------------------------------------------
(require :asdf)
(require :usocket)
(require :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar population_in)
(setf key_in (nth 6 (si:command-args)))
(setf population_in (nth 7 (si:command-args)))
(format t "~a ~a~%" key_in population_in)

(usocket:with-client-socket (socket stream "localhost" 21201)
	(socket_update_proc stream key_in population_in)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

