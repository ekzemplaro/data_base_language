; -------------------------------------------------------------------
;
;	text_manipulate.lsp
;
;					Jan/24/2014
; -------------------------------------------------------------------
(define (split_line_proc line delimit)
	(setf qqa (parse line delimit))
	(setf key (qqa 0))
;
	(new Tree 'unit_aa)
	(unit_aa "name" (qqa 1))
	(unit_aa "population" (qqa 2))
	(unit_aa "date_mod" (qqa 3))
;
	(list key (unit_aa))
)
	
; -------------------------------------------------------------------
(define (text_to_dict_proc file_in)
	(setf delimit "\t")
	(setf str_in (read-file file_in))
	(setf lines (parse str_in "\n"))
	(dolist (line lines)
		(if (< 0 (length line))
			(begin
			(setf ll (split_line_proc line delimit))
			(dict_aa (ll 0) (ll 1))
			)
		)
	)
)
;
; -------------------------------------------------------------------
(define (dict_display_proc)
;
	(dolist (vv (dict_aa))
		(print (first vv))
		(print "\t")
		(setf rr (first (rest vv)))
		(print (last (assoc "name" rr)))
		(print "\t")
		(print (last (assoc "population" rr)))
		(print "\t")
		(println (last (assoc "date_mod" rr)))
	)
)

; -------------------------------------------------------------------
(define (unit_gen_proc name population date_mod)
;
	(new Tree 'unit_aa)
	(unit_aa "name" name)
	(unit_aa "population" population)
	(unit_aa "date_mod" date_mod)
;
	(unit_aa)
)
; -------------------------------------------------------------------
(define (string_gen_proc item delimit)
	(setf name (last (assoc "name" (item 1))))
	(setf population (last (assoc "population" (item 1))))
	(setf date_mod (last (assoc "date_mod" (item 1))))
	(append (item 0)
		delimit name
		delimit (string population)
		delimit date_mod
		"\n"
	)
)

; -------------------------------------------------------------------
(define (text_write_proc file_out)
	(setf delimit "\t")
	(setq str_out "")
	(dolist (item (dict_aa))
		(setq str_out (append str_out (string_gen_proc item delimit)))
		)
;
	(write-file file_out str_out)
)

; -------------------------------------------------------------------
(define (dict_update_proc population_in)
(setf today (format "%s-%s-%s" (string ((now) 0)) (string ((now) 1)) (string ((now) 2))))

(setf vv (assoc key_in (dict_aa)))
;(println vv)
(setf value (vv 1))
;(println value)
(setf pp (assoc "population" value))
;(println pp)
;
(setf (last (assoc "population" value)) population_in)
(setf (last (assoc "date_mod" value)) today)
;
;(println value)
(setf (vv 1) value)
;(println vv)
(setf (assoc key_in (dict_aa)) vv)
;
(dict_aa key_in value)
;
;(println (dict_aa))
)

; -------------------------------------------------------------------
(define (csv_to_dict_proc file_in)
	(setf delimit ",")
	(setf str_in (read-file file_in))
	(setf lines (parse str_in "\n"))
	(dolist (line lines)
		(if (< 0 (length line))
			(begin
			(setf ll (split_line_proc line delimit))
			(dict_aa (ll 0) (ll 1))
			)
		)
	)
)
;
; -------------------------------------------------------------------
(define (csv_write_proc file_out)
	(setf delimit ",")
	(setq str_out "")
	(dolist (item (dict_aa))
		(setq str_out (append str_out (string_gen_proc item delimit)))
		)
;
	(write-file file_out str_out)
)

; -------------------------------------------------------------------
