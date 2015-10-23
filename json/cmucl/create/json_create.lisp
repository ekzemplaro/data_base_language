; -------------------------------------------------------------------
;
;	json_create.lisp
;
;						Oct/17/2013
;
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :cl-json)
;
(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t0921" "宇都宮" 25697 '1980-5-17))
(setf dict_aa (dict_append_proc dict_aa "t0922" "小山" 37182 '1980-8-24))
(setf dict_aa (dict_append_proc dict_aa "t0923" "佐野" 41529 '1980-9-25))
(setf dict_aa (dict_append_proc dict_aa "t0924" "足利" 56371 '1980-3-7))
(setf dict_aa (dict_append_proc dict_aa "t0925" "日光" 78914 '1980-7-18))
(setf dict_aa (dict_append_proc dict_aa "t0926" "下野" 17482 '1980-11-17))
(setf dict_aa (dict_append_proc dict_aa "t0927" "さくら" 91354 '1980-3-9))
(setf dict_aa (dict_append_proc dict_aa "t0928" "矢板" 62593 '1980-8-12))
(setf dict_aa (dict_append_proc dict_aa "t0929" "真岡" 93251 "1980-3-28"))
(setf dict_aa (dict_append_proc dict_aa "t0930" "栃木" 51627 "1980-10-26"))
(setf dict_aa (dict_append_proc dict_aa "t0931" "大田原" 58761 "1980-5-21"))
(setf dict_aa (dict_append_proc dict_aa "t0932" "鹿沼" 46592 "1980-2-12"))
(setf dict_aa (dict_append_proc dict_aa "t0933" "那須塩原" 41728 "1980-6-18"))
(setf dict_aa (dict_append_proc dict_aa "t0934" "那須烏山" 25697 "1980-2-19"))

dict_aa)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setf file_out (car *command-line-application-arguments*))

(format t "~a~%" file_out)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(json_write_proc file_out dict_aa)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
