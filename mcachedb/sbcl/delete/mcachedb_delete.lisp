#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	mcachedb_delete.lisp
;
;						Jan/08/2014
;
; -------------------------------------------------------------------
(require :asdf)
(require :asdf-install)
(pushnew "/usr/share/common-lisp/source/usocket/" asdf:*central-registry* :test #'equal)
(require :usocket)
;
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar command)

(setf key_in (cadr *posix-argv*))


(format t "~a~%" key_in)
(setf command (format nil
	"delete ~a~c~c" key_in #\Cr #\Lf))
(format t "~a~%" command)
;
(usocket:with-client-socket
	(socket stream "localhost" 21201)
	(format stream command)
	)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
