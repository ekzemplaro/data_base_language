; -------------------------------------------------------------------
;
;	ftp_delete.cl
;
;						Oct/16/2013
;
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(asdf:load-system :cl-json)
;
(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(require :ftp)
(use-package :net.ftp.client)
(setf key_in (cadr (system:command-line-arguments)))
(format t "~a~%" key_in)
;
(setq file_json "/tmp/iwate.json")
;
(setq net.ftp.client:*default-user* "scott" net.ftp.client:*default-password* "tiger")
(net.ftp.client:ftp-get "host_dbase" "city/iwate.json" file_json)
;
(setf str_json (file_to_str file_json))
;
;(json_display_proc str_json)
;
(defvar alist_aa)
(setf alist_aa (with-input-from-string (s str_json) (json:decode-json s)))
;
(alist_delete_proc alist_aa key_in)
(setq file2_json "/tmp/iwate_new.json")
(to_json_file alist_aa file2_json)
;
(net.ftp.client:ftp-put "host_dbase" file2_json "city/iwate.json")
;
(delete-file file_json)
(delete-file file2_json)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
