#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	json_update.lisp
;
;						Oct/16/2013
;
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :cl-json)
;
(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
;
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_json)
(defvar key_in)
(defvar population_in)
(setf file_json (cadr *posix-argv*))
(setf key_in (caddr *posix-argv*))
(setf population_in (cadddr *posix-argv*))
(format t "~a~%" file_json)
(format t "~a ~a~%" key_in population_in)

(defvar str_json)
(setf str_json (file_to_str file_json))

(defvar alist_aa)
(setf alist_aa (with-input-from-string (s str_json) (json:decode-json s)))
;
(alist_update_proc alist_aa key_in population_in)
(to_json_file alist_aa file_json)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
