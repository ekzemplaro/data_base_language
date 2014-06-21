#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	couch_read.lsp
;
;						Jan/24/2014
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/json_manipulate.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf url_in "http://host_dbase:5984/city/cities")
(setf str_json (get-url url_in))

(println (string? str_json))

(setf dict_aa (json-parse str_json))

(dict_display_proc dict_aa)

(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
