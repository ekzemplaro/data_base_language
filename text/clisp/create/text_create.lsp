#! /usr/bin/clisp
; -------------------------------------------------------------------
;
;	text_create.lsp
;
;						Oct/17/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defparameter dict_aa (make-hash-table))
;
(setf dict_aa (dict_append_proc dict_aa "t2381" '名古屋 '63891 '1973-8-18))
(setf dict_aa (dict_append_proc dict_aa "t2382" '豊橋 '42576 '1973-9-21))
(setf dict_aa (dict_append_proc dict_aa "t2383" '岡崎 '37129 '1973-8-25))
(setf dict_aa (dict_append_proc dict_aa "t2384" '一宮 '54821 '1973-6-7))
(setf dict_aa (dict_append_proc dict_aa "t2385" '蒲郡 '73124 '1973-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2386" '常滑 '13482 '1973-11-17))
(setf dict_aa (dict_append_proc dict_aa "t2387" '大府 '91357 '1973-3-9))
(setf dict_aa (dict_append_proc dict_aa "t2388" '瀬戸 '62593 '1973-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2389" '犬山 '49158 "1973-3-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (car *args*))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(text_write_proc file_out dict_aa)
(format t "*** 終了 ***")
; -------------------------------------------------------------------
