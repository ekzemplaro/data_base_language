#! /usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	mcached_delete.scm
;;
;;					Jan/27/2014
;;
;; ----------------------------------------------------------------------
(let ((port (current-output-port)))
            (set-port-encoding! port "utf-8"))
;;
(display "*** 開始 ***\n")
(define key_in (cadr (command-line)))
(display key_in)
(newline)
(define hostname "127.0.0.1")
(define port 11211)
(define command (string-append "delete " key_in "\r\n"))
(let ((ss (socket PF_INET SOCK_STREAM 0)))
	(connect ss AF_INET (inet-pton AF_INET hostname) port)
	(display command ss))
(display "*** 終了 ***\n")
(newline)
;; ----------------------------------------------------------------------

