#
curl --noproxy '*' http://dfx035:5984/_all_dbs
#
echo '*** aaa ***'
#
URL_TARGET="http://dfx035:5984/nagano"
curl --noproxy '*' -X DELETE $URL_TARGET
curl --noproxy '*' -X PUT $URL_TARGET
#
#
curl --noproxy '*' -H "Content-Type: application/json" \
	-X POST 'http://localhost:5984/_replicate' \
    -d'{"source":"http://localhost:5984/nagano","target":"http://dfx035:5984/nagano"}'
#
