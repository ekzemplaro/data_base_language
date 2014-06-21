; -------------------------------------------------------------------
;
;	redis_read.lisp
;
;						Jan/16/2014
; -------------------------------------------------------------------
(require :asdf)
(require :usocket)
(require :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/redis_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(defvar keys)
(setf keys '("t1851" "t1852" "t1853" "t1854" "t1855"
	"t1856" "t1857" "t1858" "t1859"))
(usocket:with-client-socket (socket stream "host_dbase" 6379)
	(mapcar (lambda (x) (redis_socket_read_proc stream x)) keys)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

