; -------------------------------------------------------------------
;
;	text_create.cl
;
;						Oct/10/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/allegro_common/text_manipulate.cl")
; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defparameter dict_aa (make-hash-table))
;
(setq dict_aa (dict_append_proc dict_aa "t2381" '名古屋 '57912 '1974-9-15))
(setq dict_aa (dict_append_proc dict_aa "t2382" '豊橋 '42532 '1974-2-21))
(setq dict_aa (dict_append_proc dict_aa "t2383" '岡崎 '37129 '1974-3-25))
(setq dict_aa (dict_append_proc dict_aa "t2384" '一宮 '54371 '1974-6-7))
(setq dict_aa (dict_append_proc dict_aa "t2385" '蒲郡 '73824 '1974-10-18))
(setq dict_aa (dict_append_proc dict_aa "t2386" '常滑 '13982 '1974-11-17))
(setq dict_aa (dict_append_proc dict_aa "t2387" '大府 '97215 '1974-3-9))
(setq dict_aa (dict_append_proc dict_aa "t2388" '瀬戸 '62593 '1974-8-12))
(setq dict_aa (dict_append_proc dict_aa "t2389" '犬山 '47591 '1974-1-25))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(setq file_out (cadr (system:command-line-arguments)))
(format t "~a~%" file_out)
;
(setf *hh* (data_prepare_proc))
(dict_display_proc *hh* )
;
(text_write_proc file_out *hh*)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
