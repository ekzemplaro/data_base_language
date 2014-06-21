#! /usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	tyrant_delete.scm
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
(let ((s (socket PF_INET SOCK_STREAM 0)))
    (connect s AF_INET (inet-pton AF_INET "127.0.0.1") 1978)
    (display (string-append "delete " key_in "\r\n") s))
(display "*** 終了 ***\n")
(newline)
;; ----------------------------------------------------------------------

