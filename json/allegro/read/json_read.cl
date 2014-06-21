; -------------------------------------------------------------------
;
;	json_read.cl
;
;						Jan/14/2014
;
; -------------------------------------------------------------------
(require :asdf)
(asdf:load-system :cl-json)
;
(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
;
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_json)
(setf file_json (cadr (system:command-line-arguments)))
(format t "~a~%" file_json)

(setf str_in (file_to_str file_json))
;
(json_display_proc str_in)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
