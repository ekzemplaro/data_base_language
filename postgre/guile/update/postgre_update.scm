#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	postgre_update.scm
;;
;;					Jan/14/2014
;;
;; ----------------------------------------------------------------------
(use-modules (database postgres))
(use-modules (srfi srfi-1) (srfi srfi-13) (srfi srfi-19))
;; ----------------------------------------------------------------------
(let ((port (current-output-port)))
            (set-port-encoding! port "utf-8"))
(display   "*** 開始 ***\n")
(define today (date->string (current-date) "~Y-~m-~d"))
(define key_in (cadr (command-line)))
(define population_in (caddr (command-line)))
(define sql_str (string-append
	"update cities set POPULATION=" population_in " , DATE_MOD='" today
	"' where ID='" key_in "'"))
(display key_in)
(display "\t")
(display population_in)
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
