#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	sqlite3_create.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/sbcl_common/text_manipulate.lisp")
; -------------------------------------------------------------------
(defun data_prepare_proc ()

(defvar dict_aa)
(defparameter dict_aa (make-hash-table))
;
(format t "*** check *** cccc ***~%")
;
(setf dict_aa (dict_append_proc dict_aa "t0711" '郡山 '76512 '1975-2-8))
(setf dict_aa (dict_append_proc dict_aa "t0712" '会津若松 '42583 '1975-4-12))
(setf dict_aa (dict_append_proc dict_aa "t0713" '白河 '37629 '1975-8-25))
(setf dict_aa (dict_append_proc dict_aa "t0714" '福島 '54321 '1975-6-7))
(setf dict_aa (dict_append_proc dict_aa "t0715" '喜多方 '71624 '1975-3-18))
(setf dict_aa (dict_append_proc dict_aa "t0716" '二本松 '19682 '1975-11-17))
(setf dict_aa (dict_append_proc dict_aa "t0717" 'いわき '94357 '1975-3-9))
(setf dict_aa (dict_append_proc dict_aa "t0718" '相馬 '62593 '1975-8-12))
(setf dict_aa (dict_append_proc dict_aa "t0719" '須賀川 '49258 "1975-3-21"))

dict_aa)
; -------------------------------------------------------------------
(defun dict_insert_proc (key value)
	(defvar s0)
	(defvar s1)
	(defvar s2)
	(defvar command)
	(setf s0 (gethash 'name value))
	(setf s1 (gethash 'population value))
	(setf s2 (gethash 'date_mod value))
	(setf command (format nil "insert into cities (id, name, population, date_mod) values ('~a','~a',~a,'~a')~%" key s0 s1 s2))
	command
)

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(require :asdf)
(require :clsql-sqlite3)
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(clsql:connect '("/var/tmp/sqlite3/cities.db") :database-type :sqlite3)
(clsql:status)
(format t "~%")
(clsql:execute-command "drop table if exists cities")
(clsql:execute-command "create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,name text,population int,date_mod text)")

(maphash #'(lambda (key value)
	(defvar command)
	(setf command (dict_insert_proc key value))
	(clsql:execute-command command)
	) dict_aa)

; -------------------------------------
(mapc #'(lambda (lst)
	(format t "~a	~a	~a	~a~%"
		(car lst) (cadr lst) (caddr lst) (nth 3 lst))
	)
	(clsql:query "select * from cities"))
;
(clsql:disconnect)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
