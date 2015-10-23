; -------------------------------------------------------------------
;
;	mcachedb_create.cl
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
(setf dict_aa (dict_append_proc dict_aa "t1521" "新潟" "95426" "1974-9-12"))
(setf dict_aa (dict_append_proc dict_aa "t1522" "長岡" "49732" "1974-2-24"))
(setf dict_aa (dict_append_proc dict_aa "t1523" "新発田" "32419" "1974-8-7"))
(setf dict_aa (dict_append_proc dict_aa "t1524" '上越 '58371 "1974-6-7"))
(setf dict_aa (dict_append_proc dict_aa "t1525" '糸魚川 '71654 "1974-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1526" '加茂 '13682 "1974-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1527" '三条 '91357 "1974-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1528" '佐渡 '62593 "1974-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1529" '柏崎 '49258 "1974-3-21"))
(setf dict_aa (dict_append_proc dict_aa "t1530" '村上 '23751 "1974-9-15"))
(setf dict_aa (dict_append_proc dict_aa "t1531" '十日町 '29158 "1974-4-18"))
(setf dict_aa (dict_append_proc dict_aa "t1532" '五泉 '57648 "1974-6-7"))

dict_aa)
)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))

;(dict_display_proc dict_aa)

(usocket:with-client-socket (socket stream "localhost" 21201)
	(maphash #'(lambda (key value) (socket_single_write_proc stream key value)) dict_aa)
)
;	(socket_update_proc stream key_in population_in)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

