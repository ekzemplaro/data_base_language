; -------------------------------------------------------------------
;
;	xml_create.lisp
;
;						Oct/08/2013
;
; -------------------------------------------------------------------
(require :asdf)
(load "/usr/share/common-lisp/source/xmls/xmls.asd")
(require :xmls)

(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t2261" '静岡 81637 '1978-9-18))
(setf dict_aa (dict_append_proc dict_aa "t2262" '浜松 53219 '1978-2-15))
(setf dict_aa (dict_append_proc dict_aa "t2263" '沼津 37674 '1978-4-24))
(setf dict_aa (dict_append_proc dict_aa "t2264" '三島 54391 '1978-6-7))
(setf dict_aa (dict_append_proc dict_aa "t2265" '富士 73684 '1978-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2266" '熱海 53612 '1978-11-17))
(setf dict_aa (dict_append_proc dict_aa "t2267" '富士宮 92357 '1978-3-9))
(setf dict_aa (dict_append_proc dict_aa "t2268" '藤枝 62573 '1978-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2269" '御殿場 49258 "1978-3-21"))
(setf dict_aa (dict_append_proc dict_aa "t2270" '島田 82147 "1978-8-14"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setq file_out (car *command-line-argument-list*))

(format t "~a~%" file_out)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(xml_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
