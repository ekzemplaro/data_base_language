; -------------------------------------------------------------------
;
;	mcached_create.lsp
;
;						Jan/13/2014
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(push #P"/usr/share/common-lisp/source/usocket/" asdf:*central-registry*)
(push #P"/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry*)
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
(setf dict_aa (dict_append_proc dict_aa "t1731" '金沢 '18476 "1973-9-12"))
(setf dict_aa (dict_append_proc dict_aa "t1732" '輪島 '89372 "1973-2-3"))
(setf dict_aa (dict_append_proc dict_aa "t1733" '小松 '76819 "1973-8-25"))
(setf dict_aa (dict_append_proc dict_aa "t1734" '七尾 '48371 "1973-6-7"))
(setf dict_aa (dict_append_proc dict_aa "t1735" '珠洲 '71654 "1973-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1736" '加賀 '13682 "1973-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1737" '羽咋 '91457 "1973-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1738" 'かほく '62593 "1973-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1739" '白山 '41258 "1973-3-21"))

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

