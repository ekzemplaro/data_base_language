#! /usr/bin/gcl -f
; -------------------------------------------------------------------
;
;	xml_create.lsp
;
;						Oct/10/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa 't2261 '静岡 '98137 '1976-2-8))
(setf dict_aa (dict_append_proc dict_aa 't2262 '浜松 '32912 '1976-5-2))
(setf dict_aa (dict_append_proc dict_aa 't2263 '沼津 '72654 '1976-10-25))
(setf dict_aa (dict_append_proc dict_aa 't2264 '三島 '54317 '1976-6-7))
(setf dict_aa (dict_append_proc dict_aa 't2265 '富士 '73624 '1976-3-18))
(setf dict_aa (dict_append_proc dict_aa 't2266 '熱海 '13682 '1976-11-17))
(setf dict_aa (dict_append_proc dict_aa 't2267 '富士宮 '91358 '1976-3-9))
(setf dict_aa (dict_append_proc dict_aa 't2268 '藤枝 '62593 '1976-8-12))
(setf dict_aa (dict_append_proc dict_aa 't2269 '御殿場 '25736 "1976-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't2270 '島田 '37651 "1976-5-14"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setf file_out (nth 1 si::*command-args*))

(format t "~a~%" file_out)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(xml_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
