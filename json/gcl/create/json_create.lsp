#! /usr/bin/gcl -f
; -------------------------------------------------------------------
;
;	json_create.lsp
;
;						Oct/02/2013
;
; -------------------------------------------------------------------
;(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
;(require :asdf)
;(require :asdf-install)

(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa 't0921 '宇都宮 '83215 '1976-5-17))
(setf dict_aa (dict_append_proc dict_aa 't0922 '小山 '52932 '1976-3-24))
(setf dict_aa (dict_append_proc dict_aa 't0923 '佐野 '35129 '1976-8-25))
(setf dict_aa (dict_append_proc dict_aa 't0924 '足利 '56321 '1976-6-7))
(setf dict_aa (dict_append_proc dict_aa 't0925 '日光 '73924 '1976-3-18))
(setf dict_aa (dict_append_proc dict_aa 't0926 '下野 '13682 '1976-11-17))
(setf dict_aa (dict_append_proc dict_aa 't0927 '日光宮 '91357 '1976-3-9))
(setf dict_aa (dict_append_proc dict_aa 't0928 '矢板 '62593 '1976-8-12))
(setf dict_aa (dict_append_proc dict_aa 't0929 '真岡 '49258 "1976-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't0930 '栃木 '53924 "1976-8-14"))
(setf dict_aa (dict_append_proc dict_aa 't0931 "大田原" 59461 "1976-5-21"))
(setf dict_aa (dict_append_proc dict_aa 't0932 "鹿沼" 46582 "1976-2-12"))
(setf dict_aa (dict_append_proc dict_aa 't0933 "那須塩原" 41728 "1976-6-18"))
(setf dict_aa (dict_append_proc dict_aa 't0934 "那須烏山" 82569 "1976-2-19"))

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
(json_write_proc file_out dict_aa)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
