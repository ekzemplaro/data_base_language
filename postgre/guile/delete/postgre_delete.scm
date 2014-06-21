#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	postgre_delete.scm
;;
;;					Jan/14/2014
;;
;; ----------------------------------------------------------------------
(use-modules (database postgres))
;; ----------------------------------------------------------------------
(let ((port (current-output-port)))
            (set-port-encoding! port "utf-8"))
(display   "*** 開始 ***\n")
(define key_in (cadr (command-line)))
(define sql_str (string-append "delete from cities where ID='" key_in "'"))
(display key_in)
(newline)
(display sql_str)
(newline)

(define conn (pg-connectdb "host=localhost user=scott password=tiger dbname=city port=5432"))
(define result (pg-exec conn sql_str))

(display (pg-ntuples result))
(display "\n")

(pg-finish conn)
(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------
