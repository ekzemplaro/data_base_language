; -------------------------------------------------------------------
;	xml_delete.lisp
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
;(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_xml)
(defvar key_in)
(setf file_xml (car *command-line-application-arguments*))
(setf key_in (cadr *command-line-application-arguments*))
(format t "~a~%" file_xml)
(format t "~a~%" key_in)
(defvar str_xml)

(setf str_xml (file_to_str file_xml))
;
(xml_parse_proc str_xml)
;
(setf str_out (xml_delete_proc str_xml key_in))
(setf stream (open file_xml :direction :output :if-exists :supersede))
(format stream str_out)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
