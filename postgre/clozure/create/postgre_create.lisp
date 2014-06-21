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
(setf dict_aa (dict_append_proc dict_aa "t3461" '広島 '32864 '1977-8-14))
(setf dict_aa (dict_append_proc dict_aa "t3462" '福山 '48936 '1977-5-21))
(setf dict_aa (dict_append_proc dict_aa "t3463" '東広島 '61928 '1977-8-15))
(setf dict_aa (dict_append_proc dict_aa "t3464" '呉 '54391 '1977-6-9))
(setf dict_aa (dict_append_proc dict_aa "t3465" '尾道 '73624 '1977-3-18))
(setf dict_aa (dict_append_proc dict_aa "t3466" '竹原 '13652 '1977-11-17))
(setf dict_aa (dict_append_proc dict_aa "t3467" '三次 '94358 '1977-3-9))
(setf dict_aa (dict_append_proc dict_aa "t3468" '大竹 '62513 '1977-8-12))
(setf dict_aa (dict_append_proc dict_aa "t3469" '府中 '49158 "1977-3-21"))

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
(require :clsql-uffi)
(require :clsql-postgresql)
(format t "*** 開始 ***~%")
;
(defvar dict_aa)
(setf dict_aa (data_prepare_proc))
;
(clsql:connect '("localhost" "city" "scott" "tiger") :database-type :postgresql)
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
(clsql:disconnect)
(format t "*** 終了 ***~%")
(quit)
; -------------------------------------------------------------------
