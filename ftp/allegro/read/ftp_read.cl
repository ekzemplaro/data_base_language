; -------------------------------------------------------------------
;
;	ftp_read.cl
;
;						Oct/11/2013
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
(setq file_json "/tmp/iwate.json")
;
(setq net.ftp.client:*default-user* "scott" net.ftp.client:*default-password* "tiger")
(net.ftp.client:ftp-get "host_dbase" "city/iwate.json" file_json)
;
(setf str_in (file_to_str file_json))
;
(json_display_proc str_in)
;
(delete-file file_json)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
