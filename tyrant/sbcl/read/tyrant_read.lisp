#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	tyrant_read.lisp
;
;						Jan/08/2014
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :usocket)
(require :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(defvar keys)
(setf keys '("t4761" "t4762" "t4763" "t4764" "t4765"
	"t4766" "t4767" "t4768" "t4769"))
(usocket:with-client-socket (socket stream "localhost" 1978)
	(mapcar (lambda (x) (socket_read_proc stream x)) keys)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

