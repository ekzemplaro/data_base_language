; -------------------------------------------------------------------
;	xml_read.lisp
;
;						Nov/04/2013
;
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/xmls/" asdf:*central-registry* :test #'equal)
(asdf:load-system :xmls)
(require :xmls)
;
(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_xml)
(setf file_xml (car *command-line-application-arguments*))
(format t "~a~%" file_xml)

(defvar str_in)

(setf str_in (file_to_str file_xml))
;
(xml_parse_proc str_in)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
