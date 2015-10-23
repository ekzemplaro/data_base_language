; -------------------------------------------------------------------
;
;	text_create.lisp
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
(setf dict_aa (dict_append_proc dict_aa "t2381" "名古屋" '82145 '1980-9-8))
(setf dict_aa (dict_append_proc dict_aa "t2382" "豊橋" '52871 '1980-2-21))
(setf dict_aa (dict_append_proc dict_aa "t2383" "岡崎" '37624 '1980-5-25))
(setf dict_aa (dict_append_proc dict_aa "t2384" "一宮" '54321 '1980-6-7))
(setf dict_aa (dict_append_proc dict_aa "t2385" "蒲郡" '73918 '1980-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2386" "常滑" '13582 '1980-11-17))
(setf dict_aa (dict_append_proc dict_aa "t2387" "大府" '94357 '1980-3-9))
(setf dict_aa (dict_append_proc dict_aa "t2388" "瀬戸" '62593 '1980-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2389" "犬山" '49278 "1980-3-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(defvar dict_aa)
(setf file_out (car *command-line-application-arguments*))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(text_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
