; -------------------------------------------------------------------
;
;	json_read.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :cl-json)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_json)
(setf file_json (nth 6 (si:command-args)))

(format t "~a~%" file_json)
;
(defvar str_json)
(setf str_json (file_to_str file_json))
;
(json_display_proc str_json)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
