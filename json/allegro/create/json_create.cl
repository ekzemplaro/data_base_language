; -------------------------------------------------------------------
;
;	json_create.cl
;
;						Feb/17/2014
;
; -------------------------------------------------------------------
(require :asdf)
(asdf:load-system :cl-json)
;
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(let (
	(dict_aa (make-hash-table))
	)
;
;
(setf dict_aa (dict_append_proc dict_aa 't0921 '宇都宮 '28759 '1974-5-21))
(setf dict_aa (dict_append_proc dict_aa 't0922 '小山 '13264 '1974-9-14))
(setf dict_aa (dict_append_proc dict_aa 't0923 '佐野 '51732 '1974-8-25))
(setf dict_aa (dict_append_proc dict_aa 't0924 '足利 '96321 '1974-6-7))
(setf dict_aa (dict_append_proc dict_aa 't0925 '日光 '78624 '1974-3-18))
(setf dict_aa (dict_append_proc dict_aa 't0926 '下野 '14682 '1974-11-17))
(setf dict_aa (dict_append_proc dict_aa 't0927 'さくら '91458 '1974-3-9))
(setf dict_aa (dict_append_proc dict_aa 't0928 '矢板 '62893 '1974-8-12))
(setf dict_aa (dict_append_proc dict_aa 't0929 '真岡 '49251 "1974-3-21"))
(setf dict_aa (dict_append_proc dict_aa 't0930 '栃木 '73618 "1974-8-14"))
(setf dict_aa (dict_append_proc dict_aa 't0931 "大田原" 58761 "1974-5-21"))
(setf dict_aa (dict_append_proc dict_aa 't0932 "鹿沼" 46582 "1974-2-12"))
(setf dict_aa (dict_append_proc dict_aa 't0933 "那須塩原" 75128 "1974-9-25"))
(setf dict_aa (dict_append_proc dict_aa 't0934 "那須烏山" 52769 "1974-3-9"))

dict_aa)
)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setf file_out (cadr (system:command-line-arguments)))

(format t "~a~%" file_out)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(json_write_proc file_out dict_aa)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
