#! /usr/bin/coffee
# ---------------------------------------------------------------
#	sqlite3_update.coffee
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
population_in = process.argv[4]

console.log (file_sqlite3)
console.log (id_in + "\t" + population_in)

db = new sqlite3.Database (file_sqlite3)

#
#command = update_command_gen (id_in,population_in)

today = text_manipulate.get_current_date_proc()
command = "update cities set population = " + population_in
command += " , date_mod = '" + today + "'"
command += " where id = '" + id_in + "'"
console.log command
db.run (command)
console.log "*** 終了 ***"
# ---------------------------------------------------------------
