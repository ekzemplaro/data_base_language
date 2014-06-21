#! /usr/bin/gcl -f
; -------------------------------------------------------------------
;
;	text_create.lsp
;
;						Oct/02/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t2381" '名古屋 '25716 '1976-8-7))
(setf dict_aa (dict_append_proc dict_aa "t2382" '豊橋 '42532 '1976-5-21))
(setf dict_aa (dict_append_proc dict_aa "t2383" '岡崎 '37619 '1976-2-25))
(setf dict_aa (dict_append_proc dict_aa "t2384" '一宮 '54931 '1976-6-7))
(setf dict_aa (dict_append_proc dict_aa "t2385" '蒲郡 '72489 '1976-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2386" '常滑 '13682 '1976-11-17))
(setf dict_aa (dict_append_proc dict_aa "t2387" '大府 '97357 '1976-3-9))
(setf dict_aa (dict_append_proc dict_aa "t2388" '瀬戸 '12592 '1976-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2389" '犬山 '79264 "1976-3-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (nth 1 si::*command-args*))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(text_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
