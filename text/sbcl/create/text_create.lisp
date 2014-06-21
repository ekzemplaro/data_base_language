#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	text_create.lisp
;
;						Jan/10/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()
(let (
	(dict_aa (make-hash-table))
	)
;
(setf dict_aa (dict_append_proc dict_aa "t2381" '名古屋 '89176 '1975-5-18))
(setf dict_aa (dict_append_proc dict_aa "t2382" '豊橋 '41532 '1975-9-21))
(setf dict_aa (dict_append_proc dict_aa "t2383" '岡崎 '37619 '1975-8-25))
(setf dict_aa (dict_append_proc dict_aa "t2384" '一宮 '58371 '1975-6-7))
(setf dict_aa (dict_append_proc dict_aa "t2385" '蒲郡 '71654 '1975-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2386" '常滑 '13682 '1975-11-17))
(setf dict_aa (dict_append_proc dict_aa "t2387" '大府 '91357 '1975-3-9))
(setf dict_aa (dict_append_proc dict_aa "t2388" '瀬戸 '62593 '1975-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2389" '犬山 '49258 "1975-3-21"))

dict_aa)
)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setf file_out (cadr *posix-argv*))

(format t "~a~%" file_out)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(text_write_proc file_out dict_aa)
(format t "*** 終了 ***")
; -------------------------------------------------------------------
