#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	csv_create.lisp
;
;						Jan/08/2014
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t1271" '千葉 '76125 '1975-4-15))
(setf dict_aa (dict_append_proc dict_aa "t1272" '勝浦 '57286 '1975-7-27))
(setf dict_aa (dict_append_proc dict_aa "t1273" '市原 '37629 '1975-2-5))
(setf dict_aa (dict_append_proc dict_aa "t1274" '流山 '54321 '1975-6-7))
(setf dict_aa (dict_append_proc dict_aa "t1275" '八千代 '73124 '1975-3-18))
(setf dict_aa (dict_append_proc dict_aa "t1276" '我孫子 '13682 '1975-11-17))
(setf dict_aa (dict_append_proc dict_aa "t1277" '鴨川 '97352 '1975-3-9))
(setf dict_aa (dict_append_proc dict_aa "t1278" '銚子 '62593 '1975-8-12))
(setf dict_aa (dict_append_proc dict_aa "t1279" '市川 '49258 "1975-3-21"))

dict_aa)
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
(csv_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
