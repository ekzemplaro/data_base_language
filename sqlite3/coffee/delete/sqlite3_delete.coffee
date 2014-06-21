#! /usr/bin/coffee
# ---------------------------------------------------------------
#	sqlite3_delete.coffee
#
#					Jul/20/2012
#
# ---------------------------------------------------------------
sqlite3 = require 'sqlite3'
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')

# ---------------------------------------------------------------
console.log "*** 開始 ***"
file_sqlite3 = process.argv[2]
id_in = process.argv[3]

console.log (file_sqlite3)
console.log (id_in)

db = new sqlite3.Database (file_sqlite3)

command = "delete from cities where id = '" + id_in + "'"
db.run (command)
#
db.close

console.log "*** 終了 ***"
# ---------------------------------------------------------------
