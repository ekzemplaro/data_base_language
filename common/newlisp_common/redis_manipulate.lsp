; -------------------------------------------------------------------
;
;	redis_manipulate.lsp
;
;					Jan/24/2014
; -------------------------------------------------------------------
(define (redis_read_proc socket key_in)
	(setf command (format "get %s\r\n" key_in))
	(net-send socket command)
	(net-receive socket buffer 10000)
;	(println buffer)
	(setf lines (parse buffer "\n"))
;	(println "*** ccc ***")
	(if (!= (0 3 (first lines)) "$-1")
	(begin
	(setf json_str (first (rest lines)))
	(record_parser key_in json_str)
	)
	)
)

; ------------------------------------------------------------------
