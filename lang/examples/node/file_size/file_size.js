#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	file_size.js
//
//					Oct/31/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
var util = require("util");

var path = process.argv[2];

oox = new Object ();

fs.readdir (path,function (err,files)
	{
	files.forEach (function (file){
		stat = fs.statSync (path + '/'+file);
		console.log (file + '\t' + stat.size);
		oox[file] = stat.size;
		});
	var json_str = JSON.stringify(oox);

	console.log (json_str);
	});
// ---------------------------------------------------------------
