; -------------------------------------------------------------------
;
;	mcached_create.lisp
;
;						Jan/13/2014
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
(setf dict_aa (dict_append_proc dict_aa "t1731" '金沢 '25176 "1978-10-15"))
(setf dict_aa (dict_append_proc dict_aa "t1732" '輪島 '14832 "1978-8-21"))
(setf dict_aa (dict_append_proc dict_aa "t1733" '小松 '82619 "1978-2-12"))
(setf dict_aa (dict_append_proc dict_aa "t1734" '七尾 '48371 "1978-6-7"))
(setf dict_aa (dict_append_proc dict_aa "t1735" '珠洲 '71654 "1978-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1736" '加賀 '13682 "1978-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1737" '羽咋 '91457 "1978-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1738" 'かほく '62593 "1978-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1739" '白山 '41258 "1978-3-21"))

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

