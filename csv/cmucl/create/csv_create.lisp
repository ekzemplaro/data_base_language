; -------------------------------------------------------------------
;
;	csv_create.lisp
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
(setf dict_aa (dict_append_proc dict_aa "t1271" "千葉" '91427 '1980-9-5))
(setf dict_aa (dict_append_proc dict_aa "t1272" "勝浦" '52718 '1980-1-14))
(setf dict_aa (dict_append_proc dict_aa "t1273" "市原" '37629 '1980-10-25))
(setf dict_aa (dict_append_proc dict_aa "t1274" "流山" '54321 '1980-6-7))
(setf dict_aa (dict_append_proc dict_aa "t1275" "八千代" '73624 '1980-3-18))
(setf dict_aa (dict_append_proc dict_aa "t1276" "我孫子" '19582 '1980-11-17))
(setf dict_aa (dict_append_proc dict_aa "t1277" "鴨川" '97351 '1980-7-9))
(setf dict_aa (dict_append_proc dict_aa "t1278" "銚子" '62793 '1980-8-12))
(setf dict_aa (dict_append_proc dict_aa "t1279" "市川" '49258 "1980-1-21"))

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
(csv_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
