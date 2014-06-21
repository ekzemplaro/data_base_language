; -------------------------------------------------------------------
;
;	xml_delete.lisp
;
;						Nov/04/2013
;
; -------------------------------------------------------------------
;(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
;(load "/usr/share/common-lisp/source/xmls/xmls.asd")
(require :asdf)
(asdf:asdf-version)
(require :xmls)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")
; -------------------------------------------------------------------
(defun main ()
(format t "*** 開始 ***~%")
(defvar key_in)
(setf file_xml (nth 6 *command-line-argument-list*))
(format t "~a~%" file_xml)
(setf key_in (nth 7 *command-line-argument-list*))
(format t "~a~%" key_in)
;
(defvar str_xml)
(setf str_xml (file_to_str file_xml))
;
(setf str_out (xml_delete_proc str_xml key_in))
(setf stream (open file_xml :direction :output :if-exists :supersede))
(format stream str_out)
;
(format t "*** 終了 ***~%")
0)
; -------------------------------------------------------------------
(main)
; -------------------------------------------------------------------
