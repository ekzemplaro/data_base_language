; -------------------------------------------------------------------
;
;	mcached_create.lisp
;
;						Jan/15/2014
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :usocket)
(require :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(defun data_prepare_proc ()
(format t "*** data_prepare_proc ***~%")
(let (
	(dict_aa (make-hash-table))
	)
;
(setf dict_aa (dict_append_proc dict_aa "t1731" '金沢 '17346 "1980-2-22"))
(setf dict_aa (dict_append_proc dict_aa "t1732" '輪島 '83972 "1980-6-10"))
(setf dict_aa (dict_append_proc dict_aa "t1733" '小松 '62819 "1980-3-13"))
(setf dict_aa (dict_append_proc dict_aa "t1734" '七尾 '41371 "1980-7-8"))
(setf dict_aa (dict_append_proc dict_aa "t1735" '珠洲 '73654 "1980-4-19"))
(setf dict_aa (dict_append_proc dict_aa "t1736" '加賀 '13682 "1980-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1737" '羽咋 '91457 "1980-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1738" 'かほく '62593 "1980-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1739" '白山 '41258 "1980-3-21"))

dict_aa)
)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))

;(dict_display_proc dict_aa)

(usocket:with-client-socket (socket stream "localhost" 11211)
	(maphash #'(lambda (key value) (socket_single_write_proc stream key value)) dict_aa)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

