; -------------------------------------------------------------------
;
;	xml_create.lisp
;
;						Oct/10/2013
;
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/xmls/" asdf:*central-registry* :test #'equal)
(asdf:load-system :xmls)
(require :xmls)
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
(setf dict_aa (dict_append_proc dict_aa "t2261" "静岡" '92481 '1980-2-8))
(setf dict_aa (dict_append_proc dict_aa "t2262" "浜松" '21537 '1980-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2263" "沼津" '37629 '1980-9-25))
(setf dict_aa (dict_append_proc dict_aa "t2264" "三島" '54321 '1980-6-7))
(setf dict_aa (dict_append_proc dict_aa "t2265" "富士" '73624 '1980-3-18))
(setf dict_aa (dict_append_proc dict_aa "t2266" "熱海" '15682 '1980-11-17))
(setf dict_aa (dict_append_proc dict_aa "t2267" "富士宮" '91358 '1980-3-9))
(setf dict_aa (dict_append_proc dict_aa "t2268" "藤枝" '59371 '1980-8-12))
(setf dict_aa (dict_append_proc dict_aa "t2269" "御殿場" '25846 "1980-5-21"))
(setf dict_aa (dict_append_proc dict_aa "t2270" "島田" '81974 "1980-9-14"))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
;
(setq file_out (car *command-line-application-arguments*))

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
