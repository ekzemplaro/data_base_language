; -------------------------------------------------------------------
;
;	xml_create.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :xmls)

(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(setf dict_aa (dict_append_proc dict_aa 't2261 '静岡 '48137 '1979-3-9))
(setf dict_aa (dict_append_proc dict_aa 't2262 '浜松 '53791 '1979-8-12))
(setf dict_aa (dict_append_proc dict_aa 't2263 '沼津 '62548 '1979-2-25))
(setf dict_aa (dict_append_proc dict_aa 't2264 '三島 '32476 '1979-6-7))
(setf dict_aa (dict_append_proc dict_aa 't2265 '富士 '73124 '1979-3-18))
(setf dict_aa (dict_append_proc dict_aa 't2266 '熱海 '13682 '1979-11-17))
(setf dict_aa (dict_append_proc dict_aa 't2267 '富士宮 '91356 '1979-3-9))
(setf dict_aa (dict_append_proc dict_aa 't2268 '藤枝 '62593 '1979-8-12))
(setf dict_aa (dict_append_proc dict_aa 't2269 '御殿場 '49758 "1979-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't2270 '島田 '61829 "1979-8-14"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setq file_out (nth 6 (si:command-args)))

(format t "~a~%" file_out)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(xml_write_proc file_out dict_aa)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
