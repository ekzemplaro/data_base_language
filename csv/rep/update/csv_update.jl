;; --------------------------------------------------------------------
;;	csv_update.jl
;;
;;						Mar/02/2011
;;
;; --------------------------------------------------------------------
(require 'tables)
(load-file "/var/www/data_base/common/rep_common/text_manipulate.jl")
;; --------------------------------------------------------------------
(format t "*** 開始 ***")
(setq file_txt (cadr command-line-args))
(setq id_in (caddr command-line-args))
(setq population_in (cadddr command-line-args))
(format t file_txt)
(format t "%1$s%2$s" id_in population_in)
;
(setq dict_aa (make-table string-hash string=))
(let ((port_in (open-file file_txt 'read)))
	(csv_read_proc port_in dict_aa)
)
;
(if (table-bound-p dict_aa id_in) 
	(dict_update_proc dict_aa id_in population_in)
)
;
(table-walk dict_display_proc_single dict_aa)
;
(csv_write_proc file_txt dict_aa)
;
(format t "*** 終了 ***")

;; --------------------------------------------------------------------
