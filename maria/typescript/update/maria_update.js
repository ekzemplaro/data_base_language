// ---------------------------------------------------------------
//	maria_update.ts
//
//					May/01/2020
//
// ---------------------------------------------------------------
var mysql = require('mysql');
var sql_manipulate = require('/var/www/data_base/common/node_common/sql_manipulate');
// ---------------------------------------------------------------
console.log("*** 開始 ***");
var id_in = process.argv[2];
var population_in = parseInt(process.argv[3]);
console.log(id_in + "\t" + population_in);
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'scott',
    password: 'tiger123'
});
connection.query('Use city');
var command = sql_manipulate.update_command_gen(id_in, population_in);
connection.query(command, function (err, rows) {
    if (err)
        throw err;
    console.log("*** 終了 ***");
});
connection.end();
console.log("*** ppp ***");
// ---------------------------------------------------------------
