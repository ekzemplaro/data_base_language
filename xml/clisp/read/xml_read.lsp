; -------------------------------------------------------------------
;
;	xml_read.lsp
;
;						Oct/08/2013
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf")
(require :asdf)
(push #P"/usr/share/common-lisp/source/xmls/" asdf:*central-registry*)
(asdf:load-system :xmls)

(load "/var/www/data_base/common/common_lisp/file_io.lisp")
(load "/var/www/data_base/common/common_lisp/xml_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_xml)
(setq file_xml (car *args*))
;
(format t "~a~%" file_xml)
;
(defvar str_in)
;
(setf str_in (file_to_str file_xml))
;
(xml_parse_proc str_in)
;
(format t "*** 終了 ***")
; -------------------------------------------------------------------
