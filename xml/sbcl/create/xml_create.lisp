#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	xml_create.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/xmls/" asdf:*central-registry* :test #'equal)
(require :xmls)

(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(let (
	(dict_aa (make-hash-table))
	)
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa 't2261 '静岡 '82137 '1975-2-18))
(setf dict_aa (dict_append_proc dict_aa 't2262 '浜松 '57286 '1975-5-21))
(setf dict_aa (dict_append_proc dict_aa 't2263 '沼津 '69175 '1975-8-25))
(setf dict_aa (dict_append_proc dict_aa 't2264 '三島 '54318 '1975-6-7))
(setf dict_aa (dict_append_proc dict_aa 't2265 '富士 '73294 '1975-3-18))
(setf dict_aa (dict_append_proc dict_aa 't2266 '熱海 '13482 '1975-11-17))
(setf dict_aa (dict_append_proc dict_aa 't2267 '富士宮 '96357 '1975-3-9))
(setf dict_aa (dict_append_proc dict_aa 't2268 '藤枝 '62593 '1975-8-12))
(setf dict_aa (dict_append_proc dict_aa 't2269 '御殿場 '49158 "1975-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't2270 '島田 '53728 "1975-8-14"))

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
(xml_write_proc file_out dict_aa)
(format t "*** check ***~%")
(format t "*** 終了 ***")
; -------------------------------------------------------------------
