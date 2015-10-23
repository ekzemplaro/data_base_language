; -------------------------------------------------------------------
;
;	xml_create.lisp
;
;						Nov/01/2013
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(require :asdf)
(push #P"/usr/share/common-lisp/source/xmls/" asdf:*central-registry*)
(asdf:load-system :xmls)

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
(setf dict_aa (dict_append_proc dict_aa 't2261 '静岡 '51239 '1977-3-15))
(setf dict_aa (dict_append_proc dict_aa 't2262 '浜松 '83127 '1977-8-21))
(setf dict_aa (dict_append_proc dict_aa 't2263 '沼津 '62981 '1977-2-8))
(setf dict_aa (dict_append_proc dict_aa 't2264 '三島 '39148 '1977-4-12))
(setf dict_aa (dict_append_proc dict_aa 't2265 '富士 '52436 '1977-3-18))
(setf dict_aa (dict_append_proc dict_aa 't2266 '熱海 '13682 '1977-11-17))
(setf dict_aa (dict_append_proc dict_aa 't2267 '富士宮 '91357 '1977-3-9))
(setf dict_aa (dict_append_proc dict_aa 't2268 '藤枝 '62593 '1977-8-12))
(setf dict_aa (dict_append_proc dict_aa 't2269 '御殿場 '49278 "1977-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't2270 '島田 '62819 "1977-8-14"))

dict_aa)
)
; -------------------------------------------------------------------
(defun main ()
(format t "*** 開始 ***~%")
(defvar file_out)
(setf file_out (nth 6 *command-line-argument-list*))
(format t "~a~%" file_out)
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(xml_write_proc file_out dict_aa)
(format t "*** 終了 ***~%")
0)
; -------------------------------------------------------------------
(main)
; -------------------------------------------------------------------
