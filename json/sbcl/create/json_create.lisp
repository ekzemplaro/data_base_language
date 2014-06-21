#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	json_create.lisp
;
;						Jan/08/2014
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :cl-json)

; -------------------------------------------------------------------
(defun data_prepare_proc ()
;
(format t "*** check *** cccc ***~%")
(let (
	(dict_aa (make-hash-table))
	)
;
(setf dict_aa (dict_append_proc dict_aa 't0921 '宇都宮 '63891 "1975-8-18"))
(setf dict_aa (dict_append_proc dict_aa 't0922 '小山 '41532 "1975-9-21"))
(setf dict_aa (dict_append_proc dict_aa 't0923 '佐野 '38629 "1975-8-25"))
(setf dict_aa (dict_append_proc dict_aa 't0924 '足利 '59321 "1975-6-7"))
(setf dict_aa (dict_append_proc dict_aa 't0925 '日光 '73624 "1975-3-18"))
(setf dict_aa (dict_append_proc dict_aa 't0926 '下野 '17682 "1975-11-17"))
(setf dict_aa (dict_append_proc dict_aa 't0927 '日光宮 '91357 "1975-3-9"))
(setf dict_aa (dict_append_proc dict_aa 't0928 '矢板 '62593 "1975-8-12"))
(setf dict_aa (dict_append_proc dict_aa 't0929 '真岡 '49258 "1975-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't0930 '栃木 '53621 "1975-8-14"))
(setf dict_aa (dict_append_proc dict_aa 't0931 "大田原" 58764 "1975-5-21"))
(setf dict_aa (dict_append_proc dict_aa 't0932 "鹿沼" 46582 "1975-2-12"))
(setf dict_aa (dict_append_proc dict_aa 't0933 "那須塩原" 84728 "1975-6-18"))
(setf dict_aa (dict_append_proc dict_aa 't0934 "那須烏山" 13269 "1975-9-25"))

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
;
(let (
	(stream (open file_out :direction :output :if-exists :supersede))
	)
(json:encode-json dict_aa stream)
(close stream)
)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
