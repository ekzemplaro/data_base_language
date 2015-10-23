; -------------------------------------------------------------------
;	ftp_read.lsp
;
;					Jul/26/2012
;
; -------------------------------------------------------------------
;(load "/usr/share/newlisp/modules/ftp.lsp")
(module "ftp.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
;
(set 'FTP:debug-flag true)
;(setf result (FTP:get "scott" "tiger" "cdbd026" "city" "iwate.json"))
(FTP:get "scott" "tiger" "cdbd026.eg.jp.honda.com" "city" "iwate.json")

(println result)
(println "*** 終了 ***")

;(setf url_in "http://host_dbase:5984/city/cities")
(setf url_in "ftp://scott:tiger@host_dbase/city/iwate.json")
(setf str_json (get-url url_in))

(println (string? str_json))
(println str_json)
(exit)
; -------------------------------------------------------------------
