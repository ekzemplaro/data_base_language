; -------------------------------------------------------------------
;
;	ftp_create.cl
;
;						Oct/11/2013
;
; -------------------------------------------------------------------
(require :asdf)
(asdf:load-system :cl-json)
;
(load "/var/www/data_base/common/allegro_common/text_manipulate.cl")
(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defparameter dict_aa (make-hash-table))
;
(setq dict_aa (dict_append_proc dict_aa "t0361" '盛岡 '57916 '1974-9-15))
(setq dict_aa (dict_append_proc dict_aa "t0362" '久慈 '49538 '1974-1-21))
(setq dict_aa (dict_append_proc dict_aa "t0363" '二戸 '31682 '1974-7-19))
(setq dict_aa (dict_append_proc dict_aa "t0364" '宮古 '54391 '1974-6-7))
(setq dict_aa (dict_append_proc dict_aa "t0365" '遠野 '73164 '1974-3-18))
(setq dict_aa (dict_append_proc dict_aa "t0366" '八幡平 '13483 '1974-11-17))
(setq dict_aa (dict_append_proc dict_aa "t0367" '大船渡 '97315 '1974-3-9))
(setq dict_aa (dict_append_proc dict_aa "t0368" '一関 '62543 '1974-8-12))
(setq dict_aa (dict_append_proc dict_aa "t0369" '花巻 '47861 '1974-1-25))

dict_aa)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(require :ftp)
(use-package :net.ftp.client)

(setq file_out "/tmp/tmp0456.json")
(format t "~a~%" file_out)
;
(setf dict_aa (data_prepare_proc))
(dict_display_proc dict_aa)
;
(json_write_proc file_out dict_aa)
;
(setq net.ftp.client:*default-user* "scott" net.ftp.client:*default-password* "tiger")
(net.ftp.client:ftp-put "host_dbase" file_out "city/iwate.json")
(delete-file file_out)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
