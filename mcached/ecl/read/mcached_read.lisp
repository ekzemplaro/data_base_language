; -------------------------------------------------------------------
;
;	mcached_read.lisp
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
(setf keys '("t1731" "t1732" "t1733" "t1734" "t1735"
	"t1736" "t1737" "t1738" "t1739"))
(usocket:with-client-socket (socket stream "localhost" 11211)
	(mapcar (lambda (x) (socket_read_proc stream x)) keys)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

