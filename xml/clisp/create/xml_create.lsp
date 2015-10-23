; -------------------------------------------------------------------
;
;	xml_create.lsp
;
;						Oct/08/2013
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

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa 't2261 '静岡 '92481 '1973-6-8))
(setf dict_aa (dict_append_proc dict_aa 't2262 '浜松 '21537 '1973-5-12))
(setf dict_aa (dict_append_proc dict_aa 't2263 '沼津 '37629 '1973-4-25))
(setf dict_aa (dict_append_proc dict_aa 't2264 '三島 '54391 '1973-6-7))
(setf dict_aa (dict_append_proc dict_aa 't2265 '富士 '73624 '1973-3-18))
(setf dict_aa (dict_append_proc dict_aa 't2266 '熱海 '13682 '1973-11-17))
(setf dict_aa (dict_append_proc dict_aa 't2267 '富士宮 '91357 '1973-3-9))
(setf dict_aa (dict_append_proc dict_aa 't2268 '藤枝 '62593 '1973-8-12))
(setf dict_aa (dict_append_proc dict_aa 't2269 '御殿場 '49278 "1973-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't2270 '島田 '62819 "1973-8-14"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setq file_out (car *args*))

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
