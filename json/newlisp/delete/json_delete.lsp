#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	json_delete.lsp
;
;						Jul/27/2012
;
; -------------------------------------------------------------------
(module "json.lsp")
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_in (main-args 2))
(setf id_in (main-args 3))
(println file_in)
(println id_in)
(setf str_json (read-file file_in))
(println (string? str_json))

(setf dict_aa (json2expr str_json))

(find id_in dict_aa)
(println $0)

(setq qq '(*))
(push id_in qq)
(find-all qq dict_aa (println $0 { }))
(print $0)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
