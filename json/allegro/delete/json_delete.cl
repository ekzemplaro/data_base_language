; -------------------------------------------------------------------
;
;	json_delete.cl
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
(setf key_in (caddr (system:command-line-arguments)))
(format t "~a~%" file_json)
(format t "~a~%" key_in)

(setf str_json (file_to_str file_json))
;
(defvar alist_aa)
(setf alist_aa (with-input-from-string (s str_json) (json:decode-json s)))
;
(alist_delete_proc alist_aa key_in)
(to_json_file alist_aa file_json)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
