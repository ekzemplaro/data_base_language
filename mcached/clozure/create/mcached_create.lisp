; -------------------------------------------------------------------
;
;	mcached_create.lisp
;
;						Jan/15/2014
; -------------------------------------------------------------------
(require :asdf)
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
(setf dict_aa (dict_append_proc dict_aa "t1731" '金沢 '73846 "1977-2-15"))
(setf dict_aa (dict_append_proc dict_aa "t1732" '輪島 '85932 "1977-4-9"))
(setf dict_aa (dict_append_proc dict_aa "t1733" '小松 '61239 "1977-1-12"))
(setf dict_aa (dict_append_proc dict_aa "t1734" '七尾 '83471 "1977-5-7"))
(setf dict_aa (dict_append_proc dict_aa "t1735" '珠洲 '65294 "1977-8-18"))
(setf dict_aa (dict_append_proc dict_aa "t1736" '加賀 '13682 "1977-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1737" '羽咋 '91457 "1977-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1738" 'かほく '62593 "1977-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1739" '白山 '41258 "1977-3-21"))

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

