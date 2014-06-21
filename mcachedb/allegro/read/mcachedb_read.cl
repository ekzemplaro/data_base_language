; -------------------------------------------------------------------
;
;	mcachedb_read.cl
;
;						Jan/15/2014
; -------------------------------------------------------------------
(require :asdf)
(asdf:load-system :usocket)
(asdf:load-system :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(defvar keys)
(setf keys '("t1521" "t1522" "t1523" "t1524" "t1525"
	"t1526" "t1527" "t1528" "t1529"))
(usocket:with-client-socket (socket stream "localhost" 21201)
	(mapcar (lambda (x) (socket_read_proc stream x)) keys)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

