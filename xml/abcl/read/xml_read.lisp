; -------------------------------------------------------------------
;
;	xml_read.lisp
;
;						Oct/08/2013
;
; -------------------------------------------------------------------
(require :asdf)
(load "/usr/share/common-lisp/source/xmls/xmls.asd")
(require :xmls)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_xml)
(setq file_xml (car *command-line-argument-list*))

(format t "~a~%" file_xml)
;
(defvar str_in)
(setf str_in (file_to_str file_xml))
;
(xml_parse_proc str_in)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
