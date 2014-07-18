#
export http_proxy=""
#
export NODE_PATH=/home/uchida/node_modules
#
curl -X DELETE http://localhost:5984/librivox
curl -X PUT http://localhost:5984/librivox
#
./data_register.js combined.json
