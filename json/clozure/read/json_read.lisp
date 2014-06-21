; -------------------------------------------------------------------
;
;	json_read.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(require :asdf)
(asdf:asdf-version)
(require :cl-json)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_json)
(defvar str_in)
(setf file_json (nth 6 *command-line-argument-list*))
(format t "~a~%" file_json)
(setf str_in (file_to_str file_json))
(json_display_proc str_in)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
