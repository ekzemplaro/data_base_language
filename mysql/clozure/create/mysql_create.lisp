; -------------------------------------------------------------------
;
;	mysql_create.lisp
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
(setf dict_aa (dict_append_proc dict_aa "t3321" '岡山 '32945 '1975-5-20))
(setf dict_aa (dict_append_proc dict_aa "t3322" '倉敷 '89516 '1975-9-15))
(setf dict_aa (dict_append_proc dict_aa "t3323" '津山 '62948 '1975-3-2))
(setf dict_aa (dict_append_proc dict_aa "t3324" '玉野 '54381 '1975-7-7))
(setf dict_aa (dict_append_proc dict_aa "t3325" '笠岡 '73674 '1975-3-18))
(setf dict_aa (dict_append_proc dict_aa "t3326" '井原 '15682 '1975-11-17))
(setf dict_aa (dict_append_proc dict_aa "t3327" '総社 '91358 '1975-3-9))
(setf dict_aa (dict_append_proc dict_aa "t3328" '高梁 '62593 '1975-8-12))
(setf dict_aa (dict_append_proc dict_aa "t3329" '新見 '41258 "1975-3-21"))

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
(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
(require :asdf)
(require :clsql-mysql)
(format t "*** 開始 ***~%")
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(clsql:connect '("host_mysql" "city" "scott" "tiger" 3306) :database-type :mysql)
(clsql:status)
(format t "~%")
(clsql:execute-command "SET NAMES utf8")
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
(clsql:disconnect)
(format t "*** 終了 ***~%")
(quit)
; -------------------------------------------------------------------
