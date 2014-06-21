#! /usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	mcached_read.scm
;;
;;					Jan/14/2014
;;
;; ----------------------------------------------------------------------
(use-modules (ice-9 rdelim))
;; ----------------------------------------------------------------------
(define (read_record_proc ss key_in)
	(display (string-append "get " key_in "\r\n") ss)
		(display key_in)
		(newline)
		(if (not (string= (read-line ss) "END" 0 3 0 3))
			(begin
			(display (read-line ss))
			(newline)
			(read-line ss)
			)
		)
	)
;;
;; ----------------------------------------------------------------------
(display "*** 開始 ***\n")
(define lists '("t1731" "t1732" "t1733" "t1734" "t1735"
	"t1736" "t1737" "t1738" "t1739")) 

(let ((ss (socket PF_INET SOCK_STREAM 0)))
    (connect ss AF_INET (inet-pton AF_INET "127.0.0.1") 11211)
	(map (lambda (x) (read_record_proc ss x)) lists)
	)
(display "*** 終了 ***\n")
(newline)
;; ----------------------------------------------------------------------

