; -------------------------------------------------------------------
;
;	json_create.lsp
;
;						Oct/08/2013
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(require :asdf)
(push #P"/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry*)
(asdf:load-system :cl-json)

(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t0921" '宇都宮 81749 "1973-5-17"))
(setf dict_aa (dict_append_proc dict_aa "t0922" '小山 74395 "1973-1-24"))
(setf dict_aa (dict_append_proc dict_aa "t0923" '佐野 41539 "1973-2-25"))
(setf dict_aa (dict_append_proc dict_aa "t0924" '足利 56381 "1973-3-7"))
(setf dict_aa (dict_append_proc dict_aa "t0925" '日光 73694 "1973-7-18"))
(setf dict_aa (dict_append_proc dict_aa "t0926" '下野 13672 "1973-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t0927" '日光宮 91357 "1973-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t0928" '矢板 62593 "1973-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t0929" '真岡 93251 "1973-3-28"))
(setf dict_aa (dict_append_proc dict_aa "t0930" '栃木 53627 "1973-10-26"))
(setf dict_aa (dict_append_proc dict_aa "t0931" "大田原" 58761 "1973-5-21"))
(setf dict_aa (dict_append_proc dict_aa "t0932" "鹿沼" 46982 "1973-2-12"))
(setf dict_aa (dict_append_proc dict_aa "t0933" "那須塩原" 41528 "1973-6-18"))
(setf dict_aa (dict_append_proc dict_aa "t0934" "那須烏山" 82169 "1973-2-19"))

dict_aa)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_out)
(setf file_out (car *args*))

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
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
