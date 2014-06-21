; -------------------------------------------------------------------
;	xml_update.cl
;
;						Nov/04/2013
;
; -------------------------------------------------------------------
(require :asdf)
(pushnew "/usr/share/common-lisp/source/cl-asdf/" asdf:*central-registry* :test #'equal)
(push #P"/usr/share/common-lisp/source/xmls/" asdf:*central-registry*)
(asdf:load-system :xmls)
;
(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_xml)
(defvar key_in)
(defvar population_in)
(setf file_xml (cadr (system:command-line-arguments)))
(setf key_in (caddr (system:command-line-arguments)))
(setf population_in (parse-integer (cadddr (system:command-line-arguments))))
(format t "~a~%" file_xml)
(format t "~a ~a~%" key_in population_in)

(setf str_xml (file_to_str file_xml))
(xml_parse_proc str_xml)
;
(setf str_out (xml_update_proc str_xml key_in population_in))
;(xml_parse_proc str_out)
(setf stream (open file_xml :direction :output :if-exists :supersede))
(format stream str_out)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
