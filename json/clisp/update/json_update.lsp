; -------------------------------------------------------------------
;
;	json_update.lsp
;
;						Oct/16/2013
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(require :asdf)
(push #P"/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry*)
(asdf:load-system :cl-json)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_json)

(setf file_json (car *args*))
(setf key_in (cadr *args*))
(setf population_in (parse-integer (caddr *args*)))
(format t "~a~%" file_json)
(format t "~a ~a~%" key_in population_in)
;
(defvar str_json)
;
(setf str_json (file_to_str file_json))
;
(setf alist_aa (with-input-from-string (s str_json) (json:decode-json s)))
;
(alist_update_proc alist_aa key_in population_in)
(to_json_file alist_aa file_json)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
