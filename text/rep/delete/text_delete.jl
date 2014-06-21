;; --------------------------------------------------------------------
;;	text_delete.jl
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
(format t file_txt)
(format t id_in)
;
(setq dict_aa (make-table string-hash string=))
(let ((port_in (open-file file_txt 'read)))
	(text_read_proc port_in dict_aa)
)
;
(if (table-bound-p dict_aa id_in) 
	(table-unset dict_aa id_in)
)
;
(table-walk dict_display_proc_single dict_aa)
;
(text_write_proc file_txt dict_aa)
;
(format t "*** 終了 ***")

;; --------------------------------------------------------------------
