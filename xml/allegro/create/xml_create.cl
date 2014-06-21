; -------------------------------------------------------------------
;
;	xml_create.cl
;
;						Nov/01/2013
;
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/cl-asdf/" asdf:*central-registry* :test #'equal)
(push #P"/usr/share/common-lisp/source/xmls/" asdf:*central-registry*)
(asdf:load-system :xmls)
;
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa 't2261 '静岡 '52381 '1974-3-8))
(setf dict_aa (dict_append_proc dict_aa 't2262 '浜松 '31682 '1974-1-12))
(setf dict_aa (dict_append_proc dict_aa 't2263 '沼津 '47619 '1974-4-25))
(setf dict_aa (dict_append_proc dict_aa 't2264 '三島 '54371 '1974-6-7))
(setf dict_aa (dict_append_proc dict_aa 't2265 '富士 '75684 '1974-3-18))
(setf dict_aa (dict_append_proc dict_aa 't2266 '熱海 '13492 '1974-11-17))
(setf dict_aa (dict_append_proc dict_aa 't2267 '富士宮 '91356 '1974-3-9))
(setf dict_aa (dict_append_proc dict_aa 't2268 '藤枝 '61793 '1974-8-12))
(setf dict_aa (dict_append_proc dict_aa 't2269 '御殿場 '49158 "1974-5-21"))
(setf dict_aa (dict_append_proc dict_aa 't2270 '島田 '12495 "1974-2-14"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setq file_out (cadr (system:command-line-arguments)))

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
