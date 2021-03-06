; -------------------------------------------------------------------
;
;	mcachedb_create.lisp
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
(setf dict_aa (dict_append_proc dict_aa "t1521" "新潟" "95726" "1980-9-12"))
(setf dict_aa (dict_append_proc dict_aa "t1522" "長岡" "97238" "1980-2-24"))
(setf dict_aa (dict_append_proc dict_aa "t1523" "新発田" "24319" "1980-7-9"))
(setf dict_aa (dict_append_proc dict_aa "t1524" '上越 '58371 "1980-1-11"))
(setf dict_aa (dict_append_proc dict_aa "t1525" '糸魚川 '71654 "1980-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1526" '加茂 '13682 "1980-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1527" '三条 '91357 "1980-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1528" '佐渡 '62593 "1980-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1529" '柏崎 '49258 "1980-3-21"))
(setf dict_aa (dict_append_proc dict_aa "t1530" '村上 '23751 "1980-9-15"))
(setf dict_aa (dict_append_proc dict_aa "t1531" '十日町 '29158 "1980-4-18"))
(setf dict_aa (dict_append_proc dict_aa "t1532" '五泉 '57648 "1980-6-7"))

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

