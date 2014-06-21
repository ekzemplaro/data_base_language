; -------------------------------------------------------------------
;
;	tyrant_create.lisp
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
(setf dict_aa (dict_append_proc dict_aa "t4761" '那覇 '89156 "1979-9-18"))
(setf dict_aa (dict_append_proc dict_aa "t4762" '宜野湾 '43762 "1979-1-26"))
(setf dict_aa (dict_append_proc dict_aa "t4763" '石垣 '37819 "1979-5-7"))
(setf dict_aa (dict_append_proc dict_aa "t4764" '浦添 '58371 "1979-6-7"))
(setf dict_aa (dict_append_proc dict_aa "t4765" '名護 '71654 "1979-3-28"))
(setf dict_aa (dict_append_proc dict_aa "t4766" '糸満 '13682 "1979-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t4767" '沖縄 '91357 "1979-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t4768" '豊見城 '62593 "1979-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t4769" 'うるま '49258 "1979-3-21"))

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

