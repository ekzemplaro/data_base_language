#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	mcachedb_create.lisp
;
;						Jan/10/2014
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
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
(setf dict_aa (dict_append_proc dict_aa "t1521" "新潟" "85296" "1975-3-12"))
(setf dict_aa (dict_append_proc dict_aa "t1522" "長岡" "41572" "1975-7-19"))
(setf dict_aa (dict_append_proc dict_aa "t1523" "新発田" "32819" "1975-8-25"))
(setf dict_aa (dict_append_proc dict_aa "t1524" '上越 '58371 "1975-6-7"))
(setf dict_aa (dict_append_proc dict_aa "t1525" '糸魚川 '71654 "1975-3-18"))
(setf dict_aa (dict_append_proc dict_aa "t1526" '加茂 '13682 "1975-11-17"))
(setf dict_aa (dict_append_proc dict_aa "t1527" '三条 '91357 "1975-3-9"))
(setf dict_aa (dict_append_proc dict_aa "t1528" '佐渡 '62593 "1975-8-12"))
(setf dict_aa (dict_append_proc dict_aa "t1529" '柏崎 '49258 "1975-3-21"))
(setf dict_aa (dict_append_proc dict_aa "t1530" '村上 '23751 "1975-9-15"))
(setf dict_aa (dict_append_proc dict_aa "t1531" '十日町 '29158 "1975-4-18"))
(setf dict_aa (dict_append_proc dict_aa "t1532" '五泉 '57648 "1975-6-7"))

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

