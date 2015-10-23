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
(setf dict_aa (dict_append_proc dict_aa "t2381" "名古屋" 89357 '1977-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2382" "豊橋" 48572 '1977-6-1))
(setf dict_aa (dict_append_proc dict_aa "t2383" "岡崎" 31659 '1977-4-25))
(setf dict_aa (dict_append_proc dict_aa "t2384" "一宮" 59371 '1977-10-7))
(setf dict_aa (dict_append_proc dict_aa "t2385" "蒲郡" 73684 '1977-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2386" "常滑" 13542 '1977-11-17))
(setf dict_aa (dict_append_proc dict_aa "t2387" "大府" 97351 '1977-2-9))
(setf dict_aa (dict_append_proc dict_aa "t2388" "瀬戸" 62583 '1977-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2389" "犬山" 49217 "1977-3-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (nth 6 *command-line-argument-list*))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(text_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
