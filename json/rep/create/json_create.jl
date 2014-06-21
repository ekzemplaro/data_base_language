;; ---------------------------------------------------------------------
;;	json_create.jl
;;
;;					Jul/25/2012
;;
;; --------------------------------------------------------------------
(require 'tables)
(load-file "/var/www/data_base/common/rep_common/text_manipulate.jl")
;; --------------------------------------------------------------------
(defun tag_out_proc (tag value)
	(setq out_str_aa (concat 'string "\"" tag "\": "))
	(setq out_str_bb (concat 'string "\"" value "\""))
	(concat 'string out_str_aa out_str_bb)
	)
;
;; --------------------------------------------------------------------
(defun json_dict_write_proc_single (key unit_bb)
	(setq out_name (tag_out_proc "name" (table-ref unit_bb "name")))
	(setq out_population (tag_out_proc "population" (table-ref unit_bb "population")))
	(setq out_date (tag_out_proc "date_mod" (table-ref unit_bb "date_mod")))
	(setq out_str 
		(concat 'string
		"\"" key "\": {" out_name "," out_population "," out_date "},\n")
		)
	)

;; --------------------------------------------------------------------
(defun json_write_proc (file_out dict_aa)
(let ((fp-file (open-file file_out 'write)))
	(setq out_str "{")
	(table-walk (lambda (key value)
		(setq out_str (concat 'string out_str
		(json_dict_write_proc_single key value))))
	dict_aa)
	(setq llx (length out_str))
	(setq out_str (substring out_str 0 (- llx 2)))
	(setq out_str (concat 'string out_str "}\n"))
	(write fp-file out_str)
	)
)

;; --------------------------------------------------------------------
(defun data_prepare_proc ()
	(setq dict_aa (make-table string-hash string=))
;
	(dict_append_proc dict_aa "t0921" "宇都宮" "32891" "1930-3-5")
	(dict_append_proc dict_aa "t0922" "小山" "12467" "1930-10-21")
	(dict_append_proc dict_aa "t0923" "佐野" "34593" "1930-5-16")
	(dict_append_proc dict_aa "t0924" "足利" "52492" "1930-9-23")
	(dict_append_proc dict_aa "t0925" "日光" "41851" "1930-8-9")
	(dict_append_proc dict_aa "t0926" "下野" "82753" "1930-5-19")
	(dict_append_proc dict_aa "t0927" "さくら" "51848" "1930-9-12")
	(dict_append_proc dict_aa "t0928" "矢板" "23752" "1930-1-18")
	(dict_append_proc dict_aa "t0929" "真岡" "51264" "1930-2-11")
	(dict_append_proc dict_aa "t0930" "栃木" "37189" "1930-9-24")
	(dict_append_proc dict_aa "t0931" "大田原" "18954" "1930-6-8")
	(dict_append_proc dict_aa "t0932" "鹿沼" "83954" "1930-5-7")
	(dict_append_proc dict_aa "t0933" "那須塩原" "95274" "1930-8-12")
	(dict_append_proc dict_aa "t0934" "那須烏山" "64235" "1930-9-21")
)

;; --------------------------------------------------------------------
(format t "*** 開始 ***")
(setq file_out (cadr command-line-args))
(format t file_out)

(setq dict_aa (data_prepare_proc))
(table-walk dict_display_proc_single dict_aa)

(json_write_proc file_out dict_aa)

(format t "*** 終了 ***")


;; ---------------------------------------------------------------------
