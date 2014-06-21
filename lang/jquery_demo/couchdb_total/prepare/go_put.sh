export http_proxy=""
#
curl -X DELETE http://localhost:5984/city
curl -X PUT http://localhost:5984/city
curl -X PUT http://localhost:5984/city/tochigi -d@tochigi.json
curl -X PUT http://localhost:5984/city/chiba -d@chiba.json
curl -X PUT http://localhost:5984/city/shizuoka -d@shizuoka.json
curl -X PUT http://localhost:5984/city/aichi -d@aichi.json
curl -X PUT http://localhost:5984/city/ishikawa -d@ishikawa.json
curl -X PUT http://localhost:5984/city/niigata -d@niigata.json
curl -X PUT http://localhost:5984/city/fukui -d@fukui.json
#
curl -X PUT http://localhost:5984/city/okinawa -d@okinawa.json
