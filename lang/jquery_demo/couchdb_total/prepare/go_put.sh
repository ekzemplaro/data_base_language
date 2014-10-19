#! /bin/bash
#
#	go_put.sh
#
#					Oct/16/2014
#
# ----------------------------------------------------------
export http_proxy=""
#
#
#
# ----------------------------------------------------------
function data_set_proc ()
{
	COL=$1
#
	curl -X DELETE http://localhost:5984/$COL
	curl -X PUT http://localhost:5984/$COL
#
	curl -X PUT http://localhost:5984/$COL/miyagi -d@data/miyagi.json
	curl -X PUT http://localhost:5984/$COL/fukushima -d@data/fukushima.json
#
	curl -X PUT http://localhost:5984/$COL/tochigi -d@data/tochigi.json
	curl -X PUT http://localhost:5984/$COL/chiba -d@data/chiba.json
#
	curl -X PUT http://localhost:5984/$COL/shizuoka -d@data/shizuoka.json
	curl -X PUT http://localhost:5984/$COL/aichi -d@data/aichi.json
	curl -X PUT http://localhost:5984/$COL/ishikawa -d@data/ishikawa.json
	curl -X PUT http://localhost:5984/$COL/niigata -d@data/niigata.json
	curl -X PUT http://localhost:5984/$COL/fukui -d@data/fukui.json
#
	curl -X PUT http://localhost:5984/$COL/mie -d@data/mie.json
	curl -X PUT http://localhost:5984/$COL/nara -d@data/nara.json
#
	curl -X PUT http://localhost:5984/$COL/okayama -d@data/okayama.json
	curl -X PUT http://localhost:5984/$COL/hiroshima -d@data/hiroshima.json
#
	curl -X PUT http://localhost:5984/$COL/kumamoto -d@data/kumamoto.json
	curl -X PUT http://localhost:5984/$COL/okinawa -d@data/okinawa.json
#
}
# ----------------------------------------------------------
data_set_proc "city"
data_set_proc "city_backup"
#
# ----------------------------------------------------------
