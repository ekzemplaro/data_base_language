// -----------------------------------------------------------------------
//	ruby_on_rails.js
//
//					Jan/15/2017
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	show_contents ("install")
	show_contents ("versions")
	show_contents ("example")
	show_contents ("database")
	show_contents ("passenger")

	show_contents ("install_arch")
})

// -----------------------------------------------------------------------
function show_contents (contents)
{
	var url_txt = contents + ".txt"
	var place = "#" + contents

	jQuery.get (url_txt,function (data_text)
                {
		jQuery (place).html (data_text)
                })
}

// -----------------------------------------------------------------------
