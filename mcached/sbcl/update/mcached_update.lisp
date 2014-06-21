#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	mcached_update.lisp
;
;						Jan/10/2014
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :usocket)
(require :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar population_in)
(setf key_in (cadr *posix-argv*))
(setf population_in (caddr *posix-argv*))
(format t "~a ~a~%" key_in population_in)

(usocket:with-client-socket (socket stream "localhost" 11211)
	(socket_update_proc stream key_in population_in)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

