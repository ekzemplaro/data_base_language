; -------------------------------------------------------------------
;
;	mcachedb_read.lisp
;
;						Jan/16/2014
; -------------------------------------------------------------------
(require :asdf)
(require :usocket)
(require :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(defvar keys)
(setf keys '("t1521" "t1522" "t1523" "t1524" "t1525"
	"t1526" "t1527" "t1528" "t1529" "t1530" "t1531" "t1532"))
(usocket:with-client-socket (socket stream "localhost" 21201)
	(mapcar (lambda (x) (socket_read_proc stream x)) keys)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

