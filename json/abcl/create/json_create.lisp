; -------------------------------------------------------------------
;
;	json_create.lisp
;
;						Oct/16/2013
;
; -------------------------------------------------------------------
(require :asdf)
(load "/usr/share/common-lisp/source/cl-json_0.5.0/cl-json.asd")
(require :cl-json)

(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t0921" '宇都宮 52169 "1978-5-7"))
(setf dict_aa (dict_append_proc dict_aa "t0922" '小山 39847 "1978-3-2"))
(setf dict_aa (dict_append_proc dict_aa "t0923" '佐野 91675 "1978-7-25"))
(setf dict_aa (dict_append_proc dict_aa "t0924" '足利 56321 "1978-3-7"))
(setf dict_aa (dict_append_proc dict_aa "t0925" '日光 71624 "1978-7-18"))
(setf dict_aa (dict_append_proc dict_aa "t0926" '下野 13982 "1978-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t0927" 'さくら 91357 "1978-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t0928" '矢板 62583 "1978-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t0929" '真岡 95271 "1978-3-28"))
(setf dict_aa (dict_append_proc dict_aa "t0930" '栃木 53427 "1978-10-26"))
(setf dict_aa (dict_append_proc dict_aa "t0931" "大田原" 53861 "1978-5-21"))
(setf dict_aa (dict_append_proc dict_aa "t0932" "鹿沼" 46182 "1978-2-12"))
(setf dict_aa (dict_append_proc dict_aa "t0933" "那須塩原" 41728 "1978-4-15"))
(setf dict_aa (dict_append_proc dict_aa "t0934" "那須烏山" 82569 "1978-9-10"))

dict_aa)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setf file_out (car *command-line-argument-list*))

(format t "~a~%" file_out)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(dict_display_proc dict_aa)
(setf stream (open file_out :direction :output :if-exists :supersede))
(json:encode-json dict_aa stream)
(close stream)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
