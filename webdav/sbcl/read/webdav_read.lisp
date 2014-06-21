#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	webdav_read.lisp
;
;						Jan/14/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(pushnew "/usr/share/common-lisp/source//cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :usocket)
(require :cl-json)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar sock)
(setq sock (usocket:socket-connect "host_dbase" 3004))
(format (usocket:socket-stream sock) "~A~C~C~A~C~C~C~C"
	"GET /city/tokyo.json HTTP/1.1"
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
;	(setq str_in (concatenate 'string str_in line))
	(format t "~A" line)
	)

(format t "~A" str_in)
(format t "~%")
;
(defvar dict_aa)
;(setf dict_aa (with-input-from-string (s str_in) (json:decode-json s)))
;
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

