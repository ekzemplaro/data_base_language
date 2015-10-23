; -------------------------------------------------------------------
;
;	mcached_create.cl
;
;						Jan/15/2014
; -------------------------------------------------------------------
(require :asdf)
(asdf:load-system :usocket)
(asdf:load-system :cl-json)
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
(setf dict_aa (dict_append_proc dict_aa "t1731" '金沢 '76281 "1974-9-12"))
(setf dict_aa (dict_append_proc dict_aa "t1732" '輪島 '65832 "1974-2-29"))
(setf dict_aa (dict_append_proc dict_aa "t1733" '小松 '57619 "1974-3-2"))
(setf dict_aa (dict_append_proc dict_aa "t1734" '七尾 '48371 "1974-6-7"))
(setf dict_aa (dict_append_proc dict_aa "t1735" '珠洲 '71654 "1974-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1736" '加賀 '13682 "1974-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1737" '羽咋 '91457 "1974-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1738" 'かほく '62593 "1974-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1739" '白山 '41258 "1974-3-21"))

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

