;; ---------------------------------------------------------------------
;;	text_create.jl
;;
;;					Jul/25/2012
;;
;; --------------------------------------------------------------------
(require 'tables)
(load-file "/var/www/data_base/common/rep_common/text_manipulate.jl")
;; --------------------------------------------------------------------
(defun tag_out_proc (port_out tag value)
	(setq out_str_aa (concat 'string "<" tag ">"))
	(setq out_str_bb (concat 'string "</" tag ">\n"))
	(write port_out out_str_aa)
	(write port_out value)
	(write port_out out_str_bb)
	)
;
;; --------------------------------------------------------------------
(defun xml_dict_write_proc_single (fp-file key unit_bb)
	(write fp-file (concat "<" key ">"))
	(tag_out_proc fp-file "name" (table-ref unit_bb "name"))
	(tag_out_proc fp-file "population" (table-ref unit_bb "population"))
	(tag_out_proc fp-file "date_mod" (table-ref unit_bb "date_mod"))
	(write fp-file (concat "</" key ">"))
	)

;; --------------------------------------------------------------------
(defun xml_write_proc (file_out dict_aa)
(let ((fp-file (open-file file_out 'write)))
	(write fp-file "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
	(write fp-file "<root>\n")
	(table-walk (lambda (key value)
		 (xml_dict_write_proc_single fp-file key value)) dict_aa)
	(write fp-file "</root>\n")
	)
)

;; --------------------------------------------------------------------
(defun data_prepare_proc ()
	(setq dict_aa (make-table string-hash string=))
;
	(dict_append_proc dict_aa "t2261" "静岡" "87639" "1930-2-5")
	(dict_append_proc dict_aa "t2262" "浜松" "12497" "1930-11-21")
	(dict_append_proc dict_aa "t2263" "沼津" "34593" "1930-3-16")
	(dict_append_proc dict_aa "t2264" "三島" "52481" "1930-9-23")
	(dict_append_proc dict_aa "t2265" "富士" "85192" "1930-8-9")
	(dict_append_proc dict_aa "t2266" "熱海" "82573" "1930-5-19")
	(dict_append_proc dict_aa "t2267" "富士宮" "51948" "1930-9-12")
	(dict_append_proc dict_aa "t2268" "藤枝" "23752" "1930-1-18")
	(dict_append_proc dict_aa "t2269" "御殿場" "51264" "1930-2-11")
	(dict_append_proc dict_aa "t2270" "島田" "37189" "1930-9-24")
)

;; --------------------------------------------------------------------
(format t "*** 開始 ***")
(setq file_out (cadr command-line-args))
(format t file_out)

(setq dict_aa (data_prepare_proc))
(table-walk dict_display_proc_single dict_aa)

(xml_write_proc file_out dict_aa)

(format t "*** 終了 ***")


;; ---------------------------------------------------------------------
