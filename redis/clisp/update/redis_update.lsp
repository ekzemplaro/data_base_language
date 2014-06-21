; -------------------------------------------------------------------
;
;	redis_update.lsp
;
;						Jan/13/2014
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(push #P"/usr/share/common-lisp/source/usocket/" asdf:*central-registry*)
(push #P"/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry*)
(asdf:load-system :usocket)
(asdf:load-system :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/redis_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(defvar key_in)
(defvar population_in)
(setf key_in (car *args*))
(setf population_in (cadr *args*))
(format t "~a ~a~%" key_in population_in)

(usocket:with-client-socket (socket stream "host_dbase" 6379)
	(redis_socket_update_proc stream key_in population_in)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

