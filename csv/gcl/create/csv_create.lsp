#! /usr/bin/gcl -f
; -------------------------------------------------------------------
;
;	csv_create.lsp
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
(setf dict_aa (dict_append_proc dict_aa "t1271" '千葉 '28973 '1976-10-8))
(setf dict_aa (dict_append_proc dict_aa "t1272" '勝浦 '42531 '1976-2-12))
(setf dict_aa (dict_append_proc dict_aa "t1273" '市原 '37629 '1976-3-5))
(setf dict_aa (dict_append_proc dict_aa "t1274" '流山 '54721 '1976-6-17))
(setf dict_aa (dict_append_proc dict_aa "t1275" '八千代 '78124 '1976-3-18))
(setf dict_aa (dict_append_proc dict_aa "t1276" '我孫子 '13482 '1976-11-17))
(setf dict_aa (dict_append_proc dict_aa "t1277" '鴨川 '97157 '1976-3-9))
(setf dict_aa (dict_append_proc dict_aa "t1278" '銚子 '62543 '1976-8-12))
(setf dict_aa (dict_append_proc dict_aa "t1279" '市川 '49258 "1976-3-21"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (nth 1 si::*command-args*))

(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(csv_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
