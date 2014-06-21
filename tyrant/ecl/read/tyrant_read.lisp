; -------------------------------------------------------------------
;
;	tyrant_read.lisp
;
;						Jan/13/2014
; -------------------------------------------------------------------
(require :asdf)
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

