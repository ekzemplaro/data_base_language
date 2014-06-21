; -------------------------------------------------------------------
;
;	redis_create.lisp
;
;						Jan/13/2014
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(push #P"/usr/share/common-lisp/source/usocket/" asdf:*central-registry*)
(push #P"/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry*)
(asdf:load-system :usocket)
(asdf:load-system :cl-json)
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/redis_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/mcached_manipulate.lisp")
; -------------------------------------------------------------------
(defun data_prepare_proc ()
(format t "*** data_prepare_proc ***~%")
(let (
	(dict_aa (make-hash-table))
	)
;
(setf dict_aa (dict_append_proc dict_aa "t1851" '福井 '27916 "1973-2-18"))
(setf dict_aa (dict_append_proc dict_aa "t1852" '敦賀 '81672 "1973-1-24"))
(setf dict_aa (dict_append_proc dict_aa "t1853" '小浜 '74289 "1973-9-7"))
(setf dict_aa (dict_append_proc dict_aa "t1854" '大野 '58371 "1973-2-12"))
(setf dict_aa (dict_append_proc dict_aa "t1855" '勝山 '71654 "1973-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1856" '鯖江 '13682 "1973-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1857" 'あわら '91457 "1973-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1858" '越前 '61593 "1973-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1859" '坂井 '48259 "1973-3-21"))

dict_aa)
)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))

;(dict_display_proc dict_aa)

(usocket:with-client-socket (socket stream "host_dbase" 6379)
	(maphash #'(lambda (key value) (redis_socket_single_write_proc stream key value)) dict_aa)
)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

