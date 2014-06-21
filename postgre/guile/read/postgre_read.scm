#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	postgre_read.scm
;;
;;					Dec/27/2013
;;
;; ----------------------------------------------------------------------
(let ((port (current-output-port)))
            (set-port-encoding! port "utf-8"))
(display   "*** 開始 ***\n")

(use-modules (database postgres))
(define conn (pg-connectdb "host=localhost user=scott password=tiger dbname=city port=5432"))
(define result (pg-exec conn "SELECT * FROM cities"))

(define nmax (pg-ntuples result))
(let countup ((it 0))
	(if (= it nmax) (begin (display "done") (newline))
	(begin
	(display (pg-getvalue result it 0))
	(display "\t")
	(display (pg-getvalue result it 1))
	(display "\t")
	(display (pg-getvalue result it 2))
	(display "\t")
	(display (pg-getvalue result it 3))
	(newline)
	(countup (+ it 1)))))
(display (pg-ntuples result))
(display "\n")
(pg-fname result 0)

(pg-finish conn)
(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------
