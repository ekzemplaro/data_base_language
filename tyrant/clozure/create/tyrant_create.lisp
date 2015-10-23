; -------------------------------------------------------------------
;
;	tyrant_create.lisp
;
;						Jan/16/2014
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
(setf dict_aa (dict_append_proc dict_aa "t4761" '那覇 '13756 "1977-2-27"))
(setf dict_aa (dict_append_proc dict_aa "t4762" '宜野湾 '71862 "1977-8-21"))
(setf dict_aa (dict_append_proc dict_aa "t4763" '石垣 '85219 "1977-9-15"))
(setf dict_aa (dict_append_proc dict_aa "t4764" '浦添 '58371 "1977-6-7"))
(setf dict_aa (dict_append_proc dict_aa "t4765" '名護 '71654 "1977-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t4766" '糸満 '13682 "1977-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t4767" '沖縄 '91357 "1977-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t4768" '豊見城 '62593 "1977-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t4769" 'うるま '49258 "1977-3-21"))

dict_aa)
)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))

;(dict_display_proc dict_aa)

(usocket:with-client-socket (socket stream "localhost" 1978)
	(maphash #'(lambda (key value) (socket_single_write_proc stream key value)) dict_aa)
)
;	(socket_update_proc stream key_in population_in)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

