#! /usr/bin/coffee
# ---------------------------------------------------------------
#	riak_delete.coffee
#
#					Sep/22/2015
# ---------------------------------------------------------------
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate');
# ---------------------------------------------------------------

# ---------------------------------------------------------------
console.log "*** 開始 ***"

key_in=process.argv[2]

console.log (key_in)

host_in = 'host_ubuntu'
port_in = 8098
path_target = '/riak/shimane/'+ key_in

http_manipulate.delete_proc(host_in,port_in,path_target)

console.log "*** 終了 ***"

# ---------------------------------------------------------------
