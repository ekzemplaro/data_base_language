#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	couch_read.lisp
;
;						Jan/13/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(pushnew "/usr/share/common-lisp/source//cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :usocket)
(require :cl-json)
;
; -------------------------------------------------------------------
;(load "/var/www/data_base/common/common_lisp/json_manipulate.lisp")
;
; -------------------------------------------------------------------
(defun json_display_proc (str_json)
	(print str_json)
)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar sock)
(setq sock (usocket:socket-connect "host_dbase" 5984))
(format (usocket:socket-stream sock) "~A~C~C~A~C~C~C~C"
	"GET /city/cities HTTP/1.1"
	#\Return #\Newline
	"Connection: close"
	#\Return #\Newline
	#\Return #\Newline)

(force-output (usocket:socket-stream sock))

(defvar str_in)
(setq str_in "")
(do ((line
	(read-line (usocket:socket-stream sock) nil)
	(read-line (usocket:socket-stream sock) nil)))
	((not line))
	(setq str_in (concatenate 'string str_in line))
;	(format t "~A" line)
	)

(format t "---------------------~%")
(json_display_proc str_in)
;
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

