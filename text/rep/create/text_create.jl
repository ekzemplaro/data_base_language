;; ---------------------------------------------------------------------
;;	text_create.jl
;;
;;					Jun/06/2013
;;
;; --------------------------------------------------------------------
(require 'tables)
(load-file "/var/www/data_base/common/rep_common/text_manipulate.jl")
;; --------------------------------------------------------------------

;; --------------------------------------------------------------------
(defun data_prepare_proc ()
	(setq dict_aa (make-table string-hash string=))
;
	(dict_append_proc dict_aa "t2381" "名古屋" "21386" "1930-2-14")
	(dict_append_proc dict_aa "t2382" "豊橋" "69724" "1930-10-21")
	(dict_append_proc dict_aa "t2383" "岡崎" "34513" "1930-5-16")
	(dict_append_proc dict_aa "t2384" "一宮" "52371" "1930-9-23")
	(dict_append_proc dict_aa "t2385" "蒲郡" "41852" "1930-8-9")
	(dict_append_proc dict_aa "t2386" "常滑" "82573" "1930-5-19")
	(dict_append_proc dict_aa "t2387" "大府" "51248" "1930-9-12")
	(dict_append_proc dict_aa "t2388" "瀬戸" "27453" "1930-1-18")
	(dict_append_proc dict_aa "t2389" "犬山" "51749" "1930-2-11")
)

;; --------------------------------------------------------------------
(format t "*** 開始 ***")
(setq file_out (cadr command-line-args))
(format t file_out)

(setq dict_aa (data_prepare_proc))
(table-walk dict_display_proc_single dict_aa)

(text_write_proc file_out dict_aa)

(format t "*** 終了 ***")


;; ---------------------------------------------------------------------
