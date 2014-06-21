;; ---------------------------------------------------------------------
;;	text_manipulate.jl
;;
;;					Mar/02/2011
;;
;; --------------------------------------------------------------------
(require 'tables)
;; --------------------------------------------------------------------
(defun dict_display_proc_single (key unit_bb)
(format t (concat key "\t"
	(table-ref unit_bb "name") "\t"
	(table-ref unit_bb "population") "\t"
	(table-ref unit_bb "date_mod")))
)

;; --------------------------------------------------------------------
(define (text_read_line_proc out_str delimit dict_aa)
	(string-match delimit out_str)
	(setq id (substring out_str 0 (match-start 0) ))
	(setq str_bb (substring out_str (+ (match-start 0) 1)))
	(string-match delimit str_bb)
	(setq name (substring str_bb 0 (match-start 0)))
	(setq str_cc (substring str_bb (+ (match-start 0) 1)))
	(string-match delimit str_cc)
	(setq population (substring str_cc 0 (match-start 0)))
;	(setq date_mod (substring str_cc (+ (match-start 0) 1)))
	(setq str_dd (substring str_cc (+ (match-start 0) 1)))
	(string-match "\n" str_dd)
	(setq date_mod (substring str_dd 0 (match-start 0)))
	(dict_append_proc dict_aa id name population date_mod)
)

;; --------------------------------------------------------------------
(define (text_read_proc port dict_aa)
	(let ((out_str (read-line port)))
		(if out_str (progn
			(setq delimit "\t")
;			(format standard-output "%1$s" out_str)
			(text_read_line_proc out_str delimit dict_aa)
			(text_read_proc port dict_aa)
			)
		)
	)

)

;; --------------------------------------------------------------------
(defun dict_append_proc (dict_aa id_in name population date_mod)
	(setq unit_pp (make-table string-hash string=))
	(table-set unit_pp "name" name)
	(table-set unit_pp "population" population)
	(table-set unit_pp "date_mod" date_mod)
	(table-set dict_aa id_in unit_pp)
;
	dict_aa)

;; --------------------------------------------------------------------
(defun dict_write_proc_single (fp-file key unit_bb delimit)
(write fp-file (concat key delimit
	(table-ref unit_bb "name") delimit
	(table-ref unit_bb "population") delimit
	(table-ref unit_bb "date_mod") "\n"))
)

;; --------------------------------------------------------------------
(defun text_write_proc (file_out dict_aa)
(setq delimit "\t")
(let ((fp-file (open-file file_out 'write)))
	(table-walk (lambda (key value)
		 (dict_write_proc_single fp-file key value delimit)) dict_aa)
	)
)

;; --------------------------------------------------------------------
(define (dict_update_proc doc_aa id_in population_in)
(format t "%1$s" (tablep doc_aa))
;
(let ((uu (table-ref doc_aa id_in))
	(today (current-time-string nil "%Y-%m-%d")))
	(progn
	(print "*** dict_update_proc *** pppp ***")
	(format t (table-ref uu "population"))
	(table-set uu "population" population_in)
	(table-set uu "date_mod" today)
	(print "*** dict_update_proc *** end ***\n")
	)
	)
)

;; --------------------------------------------------------------------
(define (csv_read_proc port dict_aa)
	(let ((out_str (read-line port)))
		(if out_str (progn
			(setq delimit ",")
			(text_read_line_proc out_str delimit dict_aa)
			(csv_read_proc port dict_aa)
			)
		)
	)

)

;; --------------------------------------------------------------------
(defun csv_write_proc (file_out dict_aa)
(setq delimit ",")
(let ((fp-file (open-file file_out 'write)))
	(table-walk (lambda (key value)
		 (dict_write_proc_single fp-file key value delimit)) dict_aa)
	)
)

;; --------------------------------------------------------------------
