; -------------------------------------------------------------------
;
;	json_delete.lisp
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
(setf key_in (nth 7 (si:command-args)))
(format t "~a~%" file_json)
(format t "~a~%" key_in)
;
(defvar str_json)
(setf str_json (file_to_str file_json))
;
(setf alist_aa (with-input-from-string (s str_json) (json:decode-json s)))
;
(alist_delete_proc alist_aa key_in)
(to_json_file alist_aa file_json)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
