; -------------------------------------------------------------------
;
;	json_create.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :cl-json)

(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t0921" '宇都宮 64581 "1979-2-17"))
(setf dict_aa (dict_append_proc dict_aa "t0922" '小山 71892 "1979-8-24"))
(setf dict_aa (dict_append_proc dict_aa "t0923" '佐野 52136 "1979-9-25"))
(setf dict_aa (dict_append_proc dict_aa "t0924" '足利 56391 "1979-3-7"))
(setf dict_aa (dict_append_proc dict_aa "t0925" '日光 73514 "1979-7-18"))
(setf dict_aa (dict_append_proc dict_aa "t0926" '下野 13182 "1979-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t0927" 'さくら 94257 "1979-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t0928" '矢板 62513 "1979-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t0929" '真岡 93851 "1979-3-28"))
(setf dict_aa (dict_append_proc dict_aa "t0930" '栃木 53427 "1979-10-26"))
(setf dict_aa (dict_append_proc dict_aa "t0931" "大田原" 87531 "1979-5-21"))
(setf dict_aa (dict_append_proc dict_aa "t0932" "鹿沼" 46182 "1979-2-12"))
(setf dict_aa (dict_append_proc dict_aa "t0933" "那須塩原" 41728 "1979-6-18"))
(setf dict_aa (dict_append_proc dict_aa "t0934" "那須烏山" 82569 "1979-2-19"))

dict_aa)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setf file_out (nth 6 (si:command-args)))

(format t "~a~%" file_out)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
;
(setf stream (open file_out :direction :output :if-exists :supersede))
(json:encode-json dict_aa stream)
(close stream)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
