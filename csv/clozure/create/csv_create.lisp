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
(setf dict_aa (dict_append_proc dict_aa "t1271" "千葉" 89257 '1977-2-18))
(setf dict_aa (dict_append_proc dict_aa "t1272" "勝浦" 47532 '1977-1-21))
(setf dict_aa (dict_append_proc dict_aa "t1273" "市原" 37629 '1977-5-25))
(setf dict_aa (dict_append_proc dict_aa "t1274" "流山" 54321 '1977-6-7))
(setf dict_aa (dict_append_proc dict_aa "t1275" "八千代" 73124 '1977-3-18))
(setf dict_aa (dict_append_proc dict_aa "t1276" "我孫子" 13982 '1977-11-17))
(setf dict_aa (dict_append_proc dict_aa "t1277" "鴨川" 97351 '1977-3-9))
(setf dict_aa (dict_append_proc dict_aa "t1278" "銚子" 62593 '1977-8-12))
(setf dict_aa (dict_append_proc dict_aa "t1279" "市川" 49158 "1977-3-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (nth 6 *command-line-argument-list*))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(csv_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
