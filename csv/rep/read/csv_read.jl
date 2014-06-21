;; --------------------------------------------------------------------
;;	csv_read.jl
;;
;;						Mar/02/2011
;;
;; --------------------------------------------------------------------
(require 'tables)
(load-file "/var/www/data_base/common/rep_common/text_manipulate.jl")
;; --------------------------------------------------------------------
(format t "*** 開始 ***")
(setq file_in (cadr command-line-args))
(format t file_in)
(setq dict_aa (make-table string-hash string=))
(let ((port_in (open-file file_in 'read)))
	(csv_read_proc port_in dict_aa)
)

(table-walk dict_display_proc_single dict_aa)

(format t "*** 終了 ***")

;; --------------------------------------------------------------------
