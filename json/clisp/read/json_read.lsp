; -------------------------------------------------------------------
;
;	json_read.lsp
;
;						Oct/11/2013
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(require :asdf)
(push #P"/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry*)
(asdf:load-system :cl-json)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_json)
(setf file_json (car *args*))

(format t "~a~%" file_json)
;
(defvar str_in)

(setf str_in (file_to_str file_json))
;
(json_display_proc str_in)
;
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
