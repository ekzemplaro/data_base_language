; -------------------------------------------------------------------
;
;	mcachedb_create.lsp
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
(setf dict_aa (dict_append_proc dict_aa "t1521" "新潟" "14296" "1973-2-12"))
(setf dict_aa (dict_append_proc dict_aa "t1522" "長岡" "91237" "1973-8-24"))
(setf dict_aa (dict_append_proc dict_aa "t1523" "新発田" "32419" "1973-6-8"))
(setf dict_aa (dict_append_proc dict_aa "t1524" '上越 '58376 "1973-9-7"))
(setf dict_aa (dict_append_proc dict_aa "t1525" '糸魚川 '71254 "1973-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1526" '加茂 '13682 "1973-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1527" '三条 '91357 "1973-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1528" '佐渡 '62593 "1973-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1529" '柏崎 '49258 "1973-3-21"))
(setf dict_aa (dict_append_proc dict_aa "t1530" '村上 '23751 "1973-9-15"))
(setf dict_aa (dict_append_proc dict_aa "t1531" '十日町 '29158 "1973-4-18"))
(setf dict_aa (dict_append_proc dict_aa "t1532" '五泉 '57648 "1973-6-7"))

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

