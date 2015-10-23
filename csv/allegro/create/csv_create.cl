; -------------------------------------------------------------------
;
;	csv_create.cl
;
;						Oct/10/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/allegro_common/text_manipulate.cl")
; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defparameter dict_aa (make-hash-table))
;
(setq dict_aa (dict_append_proc dict_aa "t1271" '千葉 '69124 '1974-2-7))
(setq dict_aa (dict_append_proc dict_aa "t1272" '勝浦 '48536 '1974-9-21))
(setq dict_aa (dict_append_proc dict_aa "t1273" '市原 '37629 '1974-10-25))
(setq dict_aa (dict_append_proc dict_aa "t1274" '流山 '54321 '1974-6-7))
(setq dict_aa (dict_append_proc dict_aa "t1275" '八千代 '73824 '1974-3-18))
(setq dict_aa (dict_append_proc dict_aa "t1276" '我孫子 '13562 '1974-11-17))
(setq dict_aa (dict_append_proc dict_aa "t1277" '鴨川 '97325 '1974-3-9))
(setq dict_aa (dict_append_proc dict_aa "t1278" '銚子 '62791 '1974-5-22))
(setq dict_aa (dict_append_proc dict_aa "t1279" '市川 '87193 '1974-2-18))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(setq file_out (cadr (system:command-line-arguments)))
(format t "~a~%" file_out)
;
(setf *hh* (data_prepare_proc))
(dict_display_proc *hh* )
;
(csv_write_proc file_out *hh*)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
