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
(setf dict_aa (dict_append_proc dict_aa "t1271" '千葉 '89372 '1978-10-12))
(setf dict_aa (dict_append_proc dict_aa "t1272" '勝浦 '42138 '1978-9-21))
(setf dict_aa (dict_append_proc dict_aa "t1273" '市原 '37649 '1978-1-25))
(setf dict_aa (dict_append_proc dict_aa "t1274" '流山 '54251 '1978-6-7))
(setf dict_aa (dict_append_proc dict_aa "t1275" '八千代 '73694 '1978-3-18))
(setf dict_aa (dict_append_proc dict_aa "t1276" '我孫子 '13682 '1978-11-17))
(setf dict_aa (dict_append_proc dict_aa "t1277" '鴨川 '97357 '1978-3-9))
(setf dict_aa (dict_append_proc dict_aa "t1278" '銚子 '62593 '1978-8-12))
(setf dict_aa (dict_append_proc dict_aa "t1279" '市川 '49178 "1978-3-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (car *command-line-argument-list*))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(csv_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
(quit)
; -------------------------------------------------------------------
