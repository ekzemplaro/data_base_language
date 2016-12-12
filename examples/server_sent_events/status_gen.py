#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	status_gen.py
#
#					Dec/12/2016
#
import	sys
import	os
import	json
import  datetime
import  time
import	socket
#
# -------------------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from file_io import file_write_proc
# -------------------------------------------------------------------------
def status_gen_proc (counter):
	file_out= "status.json"
	status = {}
	status['counter']=counter
	now = datetime.datetime.now()
	time_mod = now.strftime ('%Y-%m-%d %H:%M:%S')
	status['time_mod'] = time_mod
	status['hostname'] = socket.gethostname ()
#
	out_str = json.dumps (status)
	file_write_proc (file_out,out_str)
# -------------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
counter = 0
try:
	while True:
		status_gen_proc (counter)
		time.sleep (1)
		counter += 1
except KeyboardInterrupt:    # CTRL+Cを押した場合
	print ("STOP")
#


sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------------------
