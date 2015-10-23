; -------------------------------------------------------------------
;
;	json_read.lisp
;
;						Oct/17/2013
;
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :cl-json)
;
(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
;
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_json)
(setf file_json (car *command-line-application-arguments*))
(format t "~a~%" file_json)

(defvar str_json)

(setf str_json (file_to_str file_json))
;
(json_display_proc str_json)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
