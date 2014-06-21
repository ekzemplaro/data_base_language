#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	cascade_example.js
//
//					Oct/31/2012
//
// ---------------------------------------------------------------
var cascade = require("cascade");
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
cascade ([1,2,3,4,5,6,7,8],
        cascade.map (function (i){
		return (i*i);
	}),

	callout_proc
	);

console.log ("*** 終了 ***");
// ---------------------------------------------------------------
function callout_proc ()
{
	console.log ("*** callout *** start ***");
	console.log (arguments.length);

	for(var it=0; it< (arguments.length - 1); it++)
		{
		console.log (arguments[it]);
		}
	console.log ("*** callout *** end ***");
}

// ---------------------------------------------------------------
