# -*- coding: utf-8 -*-
#
#	python_common/mysql_utf8.py
#
#				Apr/21/2010
#
# --------------------------------------------------------
def	mysql_utf8_proc	(cursor):
	sql_str="SET NAMES utf8"
	cursor.execute (sql_str)
#
# --------------------------------------------------------
