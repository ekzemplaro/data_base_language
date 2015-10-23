; -------------------------------------------------------------------
;
;	xml_read.lisp
;
;						Dec/13/2014
;
; -------------------------------------------------------------------
(require :asdf)
(asdf:asdf-version)
(require :xmls)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")
; -------------------------------------------------------------------
(defun main ()
(format t "*** 開始 ***~%")
(setf file_xml (nth 6 *command-line-argument-list*))
(format t "~a~%" file_xml)
;
(defvar str_xml)
(setf str_xml (file_to_str file_xml))
;
(xml_parse_proc str_xml)
;
(format t "*** 終了 ***~%")
0)
; -------------------------------------------------------------------
(main)
; -------------------------------------------------------------------
