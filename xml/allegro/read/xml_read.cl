; -------------------------------------------------------------------
;	xml_read.cl
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
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_xml)
(setf file_xml (cadr (system:command-line-arguments)))
(format t "~a~%" file_xml)


(setf str_in (file_to_str file_xml))
;
(xml_parse_proc str_in)

(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
