#
export http_proxy=""
#
export NODE_PATH=/home/uchida/node_modules
#
curl -X DELETE http://localhost:5984/librivox_books
curl -X PUT http://localhost:5984/librivox_books
#
ls data/*.json | sed 's/data\///' | sed 's/.json//' > list.txt
#
./to_couchdb.js list.txt
#
#./to_couchdb.js list_tmp.txt
