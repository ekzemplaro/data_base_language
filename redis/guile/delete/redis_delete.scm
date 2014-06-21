#! /usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	redis_delete.scm
;;
;;					Jan/15/2014
;;
;; ----------------------------------------------------------------------
(let ((port (current-output-port)))
            (set-port-encoding! port "utf-8"))
;;
(display "*** 開始 ***\n")
(define key_in (cadr (command-line)))
(display key_in)
(newline)
(define port 6379)
(define host "172.20.248.69")
(let ((ss (socket PF_INET SOCK_STREAM 0)))
	(connect ss AF_INET (inet-pton AF_INET host) port)
	(display (string-append "del " key_in "\r\n") ss))
(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------

