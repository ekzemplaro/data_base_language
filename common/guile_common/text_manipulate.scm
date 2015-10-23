;; ----------------------------------------------------------------------
;;	text_manipulate.scm
;;
;;						Jan/20/2015
;;
;; ----------------------------------------------------------------------
(use-modules (srfi srfi-1)
                  (srfi srfi-13)
                  (srfi srfi-19))

;; ----------------------------------------------------------------------
(define (read-file file-name)
  (let ((p (open-input-file file-name)))
    (let loop((ls1 '()) (c (read-char p)))
      (if (eof-object? c)
	  (begin
	    (close-input-port p)
	    (list->string (reverse ls1)))
	  (loop (cons c ls1) (read-char p))))))


;; ----------------------------------------------------------------------
(define (text_read_proc file_in dict_aa)

(display "*** text_read_proc *** ccccc ***\n")
(let ((lines (read-file file_in)))
(begin

(let ((lines_aa (string-split lines #\newline)))
(begin
(display "*** length = ")
(display (length lines_aa))
(newline)
(display "*** check aaa ***\n")
(for-each (lambda (line)
	(if (< 0 (string-length line))
		(begin
		(let ((ppp (string-split line #\TAB)))
			(begin
				(dict_append_proc dict_aa
					(string->symbol (car ppp))
					(cadr ppp) (caddr ppp) (cadddr ppp))
				)
			)
		))
	)
	lines_aa)
)
)
)
)
)

;; ----------------------------------------------------------------------
(define (dict_display_proc dict_aa)
	(hash-fold (lambda (key value seed)
		(define uu (hashq-ref dict_aa key))
		(format #t "~a\t" (symbol->string key))
;;		(format #t "~a\t" key)
		(format #t "~a\t" (hashq-ref uu 'name))
		(format #t "~a\t" (hashq-ref uu 'population))
		(format #t "~a\n" (hashq-ref uu 'date_mod))
		(+ 1 seed)
		)   0 dict_aa)
)

;; ----------------------------------------------------------------------
(define (dict_append_proc dict_aa id name population date_mod)
	(define unit_aa (make-hash-table))
	(hashq-set! unit_aa 'name name)
	(hashq-set! unit_aa 'population population)
	(hashq-set! unit_aa 'date_mod date_mod)
	(hashq-set! dict_aa id unit_aa)
)

;; ----------------------------------------------------------------------
(define (text_write_proc file_out dict_aa)
	(with-output-to-file file_out (lambda () 
			(dict_display_proc dict_aa)
		))
)

;; ----------------------------------------------------------------------
(define (dict_update_proc dict_aa id_in population_in)
(display "*** dict_update_proc *** ccccc ***\n")
(display (hash-table? dict_aa))
(newline)
	(let ((uu (hashq-ref dict_aa (string->symbol id_in)))
		(today (date->string (current-date) "~Y-~m-~d"))
		)
		(begin
		(display "*** dict_update_proc ***\n")
		(display (hash-table? uu))
		(newline)
		(display (hashq-ref uu 'population))
		(hashq-set! uu 'population population_in)
		(hashq-set! uu 'date_mod today)
		(display "*** dict_update_proc *** end ***\n")
		)
	)
)

;; ----------------------------------------------------------------------
(define (csv_read_proc file_in dict_aa)

(display "*** csv_read_proc *** ccccc ***\n")
(let ((lines (read-file file_in)))
(begin

(let ((lines_aa (string-split lines #\newline)))
(begin
(display "*** length = ")
(display (length lines_aa))
(newline)
(display "*** check aaa ***\n")
(for-each (lambda (line)
	(if (< 0 (string-length line))
		(begin
		(let ((ppp (string-split line #\,)))
			(begin
				(dict_append_proc dict_aa
					(string->symbol (car ppp))
					(cadr ppp) (caddr ppp) (cadddr ppp))
				)
			)
		))
	)
	lines_aa)
)
)
)
)
)

;; ----------------------------------------------------------------------
(define (csv_write_exec_proc dict_aa)
	(hash-fold (lambda (key value seed)
		(define uu (hashq-ref dict_aa key))
		(format #t "~a," (symbol->string key))
		(format #t "~a," (hashq-ref uu 'name))
		(format #t "~a," (hashq-ref uu 'population))
		(format #t "~a\n" (hashq-ref uu 'date_mod))
		(+ 1 seed)
		)   0 dict_aa)
)

;; ----------------------------------------------------------------------
(define (csv_write_proc file_out dict_aa)
	(with-output-to-file file_out (lambda () 
			(csv_write_exec_proc dict_aa)
		))
)

;; ----------------------------------------------------------------------
