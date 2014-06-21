; -------------------------------------------------------------------
;
;	text_create.lisp
;
;						Oct/04/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t2381" '名古屋 '32915 '1978-10-18))
(setf dict_aa (dict_append_proc dict_aa "t2382" '豊橋 '41592 '1978-8-21))
(setf dict_aa (dict_append_proc dict_aa "t2383" '岡崎 '37619 '1978-3-25))
(setf dict_aa (dict_append_proc dict_aa "t2384" '一宮 '54381 '1978-6-7))
(setf dict_aa (dict_append_proc dict_aa "t2385" '蒲郡 '73624 '1978-1-18))
(setf dict_aa (dict_append_proc dict_aa "t2386" '常滑 '13582 '1978-11-17))
(setf dict_aa (dict_append_proc dict_aa "t2387" '大府 '91357 '1978-3-9))
(setf dict_aa (dict_append_proc dict_aa "t2388" '瀬戸 '65132 '1978-7-12))
(setf dict_aa (dict_append_proc dict_aa "t2389" '犬山 '49258 "1978-2-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (car *command-line-argument-list*))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(text_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
