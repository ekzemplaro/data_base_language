#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	mcachedb_read.lisp
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
(setf keys '("t1521" "t1522" "t1523" "t1524" "t1525"
	"t1526" "t1527" "t1528" "t1529"
	"t1530" "t1531" "t1532"))
(usocket:with-client-socket (socket stream "localhost" 21201)
	(mapcar (lambda (x) (socket_read_proc stream x)) keys)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

