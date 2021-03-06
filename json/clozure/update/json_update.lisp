; -------------------------------------------------------------------
;
;	json_update.lisp
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
(setf file_json (nth 6 *command-line-argument-list*))
(setf key_in (nth 7 *command-line-argument-list*))
(setf population_in (parse-integer (nth 8 *command-line-argument-list*)))
(format t "~a~%" file_json)
(format t "~a ~a~%" key_in population_in)
;
(defvar str_json)
(setf str_json (file_to_str file_json))
;
;(json_display_proc str_in)
(setf alist_aa (with-input-from-string (s str_json) (json:decode-json s)))
;
(alist_update_proc alist_aa key_in population_in)
(to_json_file alist_aa file_json)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
