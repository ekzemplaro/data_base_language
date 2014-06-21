#! /bin/bash
#
#	riak_create.sh
#
#					Nov/06/2013
#
#
# ----------------------------------------------------------
echo "*** 開始 ***"
#
curl -X PUT  http://localhost:8098/riak/shimane/t3251 \
	-H "Content-Type: application/json" \
	-d '{"name": "松江","population": "81529","date_mod": "2001-3-10"}'
curl -X PUT  http://localhost:8098/riak/shimane/t3252 \
	-H "Content-Type: application/json" \
	-d '{"name": "出雲","population": "52137","date_mod": "2001-2-14"}'
curl -X PUT  http://localhost:8098/riak/shimane/t3253 \
	-H "Content-Type: application/json" \
	-d '{"name": "大田","population": "37946","date_mod": "2001-10-18"}'
curl -X PUT  http://localhost:8098/riak/shimane/t3254 \
	-H "Content-Type: application/json" \
	-d '{"name": "雲南","population": "46285","date_mod": "2001-5-21"}'
curl -X PUT  http://localhost:8098/riak/shimane/t3255 \
	-H "Content-Type: application/json" \
	-d '{"name": "江津","population": "85731","date_mod": "2001-2-8"}'
curl -X PUT  http://localhost:8098/riak/shimane/t3256 \
	-H "Content-Type: application/json" \
	-d '{"name": "浜田","population": "31928","date_mod": "2001-10-5"}'
curl -X PUT  http://localhost:8098/riak/shimane/t3257 \
	-H "Content-Type: application/json" \
	-d '{"name": "益田","population": "28465","date_mod": "2001-7-21"}'
curl -X PUT  http://localhost:8098/riak/shimane/t3258 \
	-H "Content-Type: application/json" \
	-d '{"name": "安来","population": "65739","date_mod": "2001-4-12"}'
#
echo "*** 終了 ***"
# ----------------------------------------------------------
