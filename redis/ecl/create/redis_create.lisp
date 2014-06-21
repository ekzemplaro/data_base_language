; -------------------------------------------------------------------
;
;	redis_create.lisp
;
;						Jan/13/2014
; -------------------------------------------------------------------
(require :asdf)
(require :usocket)
(require :cl-json)
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
(setf dict_aa (dict_append_proc dict_aa "t1851" '福井 '52916 "1979-10-8"))
(setf dict_aa (dict_append_proc dict_aa "t1852" '敦賀 '35872 "1979-5-14"))
(setf dict_aa (dict_append_proc dict_aa "t1853" '小浜 '27149 "1979-3-15"))
(setf dict_aa (dict_append_proc dict_aa "t1854" '大野 '58371 "1979-5-7"))
(setf dict_aa (dict_append_proc dict_aa "t1855" '勝山 '71654 "1979-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1856" '鯖江 '13682 "1979-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1857" 'あわら '91457 "1979-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1858" '越前 '61593 "1979-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1859" '坂井 '48259 "1979-3-21"))

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

