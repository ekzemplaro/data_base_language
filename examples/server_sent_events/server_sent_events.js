// -------------------------------------------------------------------
//	server_sent_events.js
//					Dec/12/2016
//
// -------------------------------------------------------------------
function server_sent_events_proc ()
{
	const url_php = 'events_send.php'
	var stream = new EventSource (url_php)

stream.addEventListener('message',function (event)
	{
	console.log (event.data)

	var str_json = event.data

	var data_rec = JSON.parse (str_json)

	var str_out = ""
	str_out += "time_mod: " + data_rec['time_mod'] + '<br />'
	str_out += "counter: " + data_rec['counter'] + '<br />'


	jQuery (".contents").html (str_out)
	})

stream.addEventListener("error",function (event)
	{
	console.log ("*** error *** aaa ***")
	console.log ("*** error *** addEventListener ***")
	console.log (JSON.stringify (event))
//	stream.close();
	})

stream.addEventListener("close",function (event)
	{
	console.log ("*** close *** aaa ***")
	stream.close()
	})

stream.addEventListener("greetings",function (event)
	{
	console.log ("*** greetings *** aaa ***")
	console.log (event.data)
	})
}

// -------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start ***")

	server_sent_events_proc ()

	jQuery("#outarea_hh").text ("*** end ***")
})

// -------------------------------------------------------------------
