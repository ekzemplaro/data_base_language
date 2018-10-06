#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	elastic_update.py
#
#					Oct/06/2018
#
# -------------------------------------------------------------------
import	sys
import	requests
import	json
import	datetime
#
# -------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
key_in = sys.argv[1]
population_in = int(sys.argv[2])
#
print("%s\t%d" % (key_in, population_in))
date_mod = datetime.date.today()
str_date_mod = '%s' % date_mod
#
url = "http://localhost:9200/cities/tochigi/" + key_in + "/_update"
print(url)
#
args = {"script" : {
	"source": "ctx._source.population = params.population; ctx._source.date_mod = params.date_mod",
        "lang": "painless",
        "params" : {
            "population" : population_in,
            "date_mod" : str_date_mod
	}
	}
	}
#
print(args["script"]['params']['population'])
print(args["script"]['params']['date_mod'])
#
headers = {'content-type': 'application/json'}
#
json_str = json.dumps(args)
print(json_str)
rr=requests.post(url,data=json_str,headers=headers)
#
print(rr)
print(rr.text)
sys.stderr.write("*** 終了 ***\n")
# -------------------------------------------------------------------
