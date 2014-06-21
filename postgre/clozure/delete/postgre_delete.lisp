; -------------------------------------------------------------------
;
;	postgre_delete.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
(require :asdf)
(require :clsql-postgresql)
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar command)

(setq key_in (nth 6 *command-line-argument-list*))

(format t "~a~%" key_in)
(setf command (format nil
	"delete from cities where ID='~a'" key_in))
(format t "~a~%" command)
;
(clsql:connect '("localhost" "city" "scott" "tiger") :database-type :postgresql)
(clsql:status)
(format t "~%")
(clsql:execute-command command)
;
(clsql:disconnect)
(format t "*** 終了 ***~%")
(quit)
; -------------------------------------------------------------------
