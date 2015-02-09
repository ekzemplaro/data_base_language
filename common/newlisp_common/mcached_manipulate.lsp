; -------------------------------------------------------------------
;
;	mcached_manipulate.lsp
;
;					Jan/19/2015
; -------------------------------------------------------------------
(define (json_parser json_str)
	(setf unit_aa (json-parse json_str))
	(print (last (assoc "name" unit_aa)))
	(print "\t")
	(print (last (assoc "population" unit_aa)))
	(print "\t")
	(println (last (assoc "date_mod" unit_aa)))
)

; -------------------------------------------------------------------
(define (record_parser key json_str)
	(print key)
	(print "\t")
	(json_parser json_str)
)

; -------------------------------------------------------------------
(define (mcached_socke_read_proc socket key_in)
	(setf json_str "")
	(setf command (format "get %s\r\n" key_in))
	(net-send socket command)
	(net-receive socket buffer 10000)
	(setf lines (parse buffer "\n"))
	(if (!= (0 3 (first lines)) "END")
		(begin
		(setf json_str (first (rest lines)))
		)
	)
	json_str
)

; ------------------------------------------------------------------
(define (mcached_read_proc socket key_in)
	(setf json_str (mcached_socke_read_proc socket key_in))
	(if (!= json_str "")
		(begin
		(record_parser key_in json_str)
		)
	)
)

; ------------------------------------------------------------------
(define (tag_gen_proc tag value)
	(append "\"" tag "\": \"" value "\"")
)
; -------------------------------------------------------------------
(define (unit_string_gen_proc name population date_mod)
	(append "{"
		(tag_gen_proc "name" name) ","
		(tag_gen_proc "population" population) ","
		(tag_gen_proc "date_mod" date_mod) "}"
		)
)
; ------------------------------------------------------------------
(define (mcached_socke_write_proc socket key_in value_in)
;	(println value_in)
	(setf llx (length value_in))
;	(println llx)
	(setf command (format "set %s 0 0 %d\r\n" key_in llx))
;	(println command)
	(net-send socket command)
	(net-send socket value_in)
	(net-send socket "\r\n")

	(net-receive socket buffer 10000)
;	(println buffer)
)

; ------------------------------------------------------------------
(define (mcached_update_proc socket key_in population_in)
	(setf today (format "%s-%s-%s" (string ((now) 0)) (string ((now) 1)) (string ((now) 2))))
	(setf json_str (mcached_socke_read_proc socket key_in))
	(setf unit_aa (json-parse json_str))
	(setf name (last (assoc "name" unit_aa)))
	(setf json_new (unit_string_gen_proc (last (assoc "name" unit_aa))  population_in today))
	(mcached_socke_write_proc socket key_in json_new)
)

; ------------------------------------------------------------------
(define (dict_to_mcached_proc socket)
	(dolist (vv (dict_aa))
		(setf key (first vv))
		(setf rr (first (rest vv)))
		(setf json_str (unit_string_gen_proc
			 (last (assoc "name" rr))
			 (string (last (assoc "population" rr)))
			 (last (assoc "date_mod" rr))
			))
		(mcached_socke_write_proc socket key json_str)
	)
)

; ------------------------------------------------------------------
