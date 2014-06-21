; -------------------------------------------------------------------
;
;	text_create.lisp
;
;					Oct/04/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t2381" '名古屋 '81245 '1979-9-14))
(setf dict_aa (dict_append_proc dict_aa "t2382" '豊橋 '43176 '1979-11-21))
(setf dict_aa (dict_append_proc dict_aa "t2383" '岡崎 '37629 '1979-8-25))
(setf dict_aa (dict_append_proc dict_aa "t2384" '一宮 '54321 '1979-6-7))
(setf dict_aa (dict_append_proc dict_aa "t2385" '蒲郡 '73624 '1979-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2386" '常滑 '13982 '1979-12-17))
(setf dict_aa (dict_append_proc dict_aa "t2387" '大府 '97157 '1979-5-9))
(setf dict_aa (dict_append_proc dict_aa "t2388" '瀬戸 '62513 '1979-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2389" '犬山 '49258 "1979-7-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (nth 6 (si:command-args)))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(text_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
