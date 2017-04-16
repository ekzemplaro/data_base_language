// -----------------------------------------------------------------------
//	jsgrid01.js
//
//						Apr/15/2017
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start ***")

	const city = data_prepare_proc ()
	table_proc (city)

	jQuery("#outarea_hh").text ("*** end ***")
})

// -----------------------------------------------------------------------
function data_prepare_proc ()
{
	const city = [
{"id":"t0921","name":"宇都宮","population":68715,"date_mod":"1950-9-24"},
{"id":"t0922","name":"小山","population":29157,"date_mod":"1950-3-15"},
{"id":"t0923","name":"佐野","population":65741,"date_mod":"1950-10-7"},
{"id":"t0924","name":"足利","population":38164,"date_mod":"1950-6-22"},
{"id":"t0925","name":"日光","population":49675,"date_mod": "1950-8-28"},
{"id":"t0926","name":"下野","population":65813,"date_mod":"1950-9-12"},
{"id":"t0927","name":"さくら","population":37251,"date_mod":"1950-3-21"},
{"id":"t0928","name":"矢板","population":52416,"date_mod":"1950-7-26"},
{"id":"t0929","name":"真岡","population":26857,"date_mod":"1950-10-2"},
{"id":"t0930","name":"栃木","population":48923,"date_mod":"1950-12-20"},
{"id":"t0931","name":"大田原","population":75284,"date_mod":"1950-2-7"},
{"id":"t0932","name":"鹿沼","population":92351,"date_mod":"1950-5-17"},
{"id":"t0933","name":"那須塩原","population":81937,"date_mod":"1950-6-19"},
{"id":"t0934","name":"那須烏山","population":72158,"date_mod":"1950-8-14"}
]

	return	city
}

// -----------------------------------------------------------------------
function table_proc (city)
{
	jQuery("#jsGrid").jsGrid({
		width: "100%",
		height: "400px",
 
	inserting: true,
	editing: true,
	sorting: true,
	paging: true,
 
	data: city,
 
	fields: [
		{ name: "id", type: "text", width: 30, validate: "required" },
		{ name: "name", type: "text", width: 30, validate: "required" },
		{ name: "population", type: "number", width: 30 },
		{ name: "date_mod", type: "text", width: 30 },
		{ type: "control" }
		]
	})
}

// -----------------------------------------------------------------------
