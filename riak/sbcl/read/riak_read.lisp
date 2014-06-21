#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	riak_read.lisp
;
;						Oct/17/2013
;
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(asdf:load-system :usocket)
(require :usocket)
;
(pushnew "/usr/share/common-lisp/source//cl-json_0.5.0/" asdf:*central-registry* :test #'equal)
(require :cl-json)
; -------------------------------------------------------------------
(defun get_riak_value (sock key_in)
(defvar str_get)
(setq str_get (concatenate 'string "GET " "/riak/shimane/" key_in " HTTP/1.1"))
;(format t str_get)
(format (usocket:socket-stream sock) "~A~C~C~A~C~C~C~C"
	str_get
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
str_in
)
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar sock)
(setq sock (usocket:socket-connect "localhost" 8098))

(defvar key_in)
(defvar str_in)
;
(format t "*** aaaa ***~%")
(setq key_in "t3251")
(setq str_in (get_riak_value sock key_in))
(format t "~A~%" str_in)
;
(format t "*** cccc ***~%")
(setq str_in (get_riak_value sock "t3252"))
(format t "~A~%" str_in)
(format t "*** eeee ***~%")
;
(usocket:socket-close sock)
;
(defvar dict_aa)
;(setf dict_aa (with-input-from-string (s str_in) (json:decode-json s)))
;
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------

