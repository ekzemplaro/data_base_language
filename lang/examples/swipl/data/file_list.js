#! /usr/bin/node
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
var fs = require('fs');
fs.readdir('.', function(err, files){
	if (err) throw err;

    var fileList = [];
    files.filter(function(file){
        return fs.statSync(file).isFile() && /.*\.txt$/.test(file); //絞り込み
    }).forEach(function (file) {
        fileList.push(file);
});

	var json_str = JSON.stringify(fileList);
	console.log(json_str);
});

// ---------------------------------------------------------------------
