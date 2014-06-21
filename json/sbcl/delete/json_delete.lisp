#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	json_delete.lisp
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
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
;
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_json)
(defvar key_in)
(setf file_json (cadr *posix-argv*))
(setf key_in (caddr *posix-argv*))
(format t "~a~%" file_json)
(format t "~a~%" key_in)

(defvar str_json)
(setf str_json (file_to_str file_json))

(defvar alist_aa)
(setf alist_aa (with-input-from-string (s str_json) (json:decode-json s)))
;
(alist_delete_proc alist_aa key_in)
(to_json_file alist_aa file_json)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
