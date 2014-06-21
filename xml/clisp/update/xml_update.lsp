#! /usr/bin/clisp
; -------------------------------------------------------------------
;
;	xml_update.lsp
;
;						Nov/04/2013
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(require :asdf)
(push #P"/usr/share/common-lisp/source/xmls/" asdf:*central-registry*)
(asdf:load-system :xmls)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_xml)
(setq file_xml (car *args*))
(setf key_in (cadr *args*))
(setf population_in (parse-integer (caddr *args*)))
(format t "~a~%" file_xml)
(format t "~a ~a~%" key_in population_in)
;
(defvar str_xml)
(setf str_xml (file_to_str file_xml))
;
(setf str_out (xml_update_proc str_xml key_in population_in))
(setf stream (open file_xml :direction :output :if-exists :supersede))
(format stream str_out)
(close stream)
(format t "*** 終了 ***")
; -------------------------------------------------------------------
