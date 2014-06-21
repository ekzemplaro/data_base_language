; -------------------------------------------------------------------
;
;	json_create.lisp
;
;						Oct/08/2013
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
(load "/usr/share/common-lisp/source/cl-json_0.5.0/cl-json.asd")
(require :asdf)
(asdf:asdf-version)
(require :cl-json)

(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(defun data_prepare_proc ()
(let (
	(dict_aa (make-hash-table))
	)
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa 't0921 '宇都宮 31572 "1977-5-12"))
(setf dict_aa (dict_append_proc dict_aa 't0922 '小山 39547 "1977-4-25"))
(setf dict_aa (dict_append_proc dict_aa 't0923 '佐野 21635 "1977-7-2"))
(setf dict_aa (dict_append_proc dict_aa 't0924 '足利 94321 "1977-2-9"))
(setf dict_aa (dict_append_proc dict_aa 't0925 '日光 76824 "1977-8-18"))
(setf dict_aa (dict_append_proc dict_aa 't0926 '下野 73682 "1977-11-17"))
(setf dict_aa (dict_append_proc dict_aa 't0927 '日光宮 14357 "1977-3-9"))
(setf dict_aa (dict_append_proc dict_aa 't0928 '矢板 27593 "1977-8-12"))
(setf dict_aa (dict_append_proc dict_aa 't0929 '真岡 92518 "1977-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't0930 '栃木 36251 "1977-8-14"))
(setf dict_aa (dict_append_proc dict_aa 't0931 "大田原" 51764 "1977-5-21"))
(setf dict_aa (dict_append_proc dict_aa 't0932 "鹿沼" 46572 "1977-2-12"))
(setf dict_aa (dict_append_proc dict_aa 't0933 "那須塩原" 84328 "1977-6-18"))
(setf dict_aa (dict_append_proc dict_aa 't0934 "那須烏山" 13569 "1977-9-25"))

dict_aa)
)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_out (nth 6 *command-line-argument-list*))
(format t "~a~%" file_out)
(setf dict_aa (data_prepare_proc))
(setf stream (open file_out :direction :output :if-exists :supersede))
(json:encode-json dict_aa stream)
(close stream)
;(json_write_proc file_out)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
; -------------------------------------------------------------------
