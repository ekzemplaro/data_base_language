# -*- coding: utf-8 -*-
#
#	python_common/requests_get.py
#
#					Aug/13/2017
# ----------------------------------------------------------------
import sys
import requests
#
# ----------------------------------------------------------------
def requests_get_proc(url_json):
	rr=requests.get(url_json)
#
	return rr.text
#
# ----------------------------------------------------------------
def requests_delete_proc(url_json):
	rr=requests.delete(url_json)
#
# ----------------------------------------------------------------
# def file_upload_proc(url,file_src):
#
# ----------------------------------------------------------------
def requests_put_proc(url,unit_aa):
#
	try:
		rr=requests.put(url,unit_aa)
#
		print(rr)
		print()
		print(str(rr.content,'utf-8'))
		print()
		print(rr.headers)
	except Exception as ee:
		sys.stderr.write(str(ee) + '\n')
#
# ----------------------------------------------------------------
