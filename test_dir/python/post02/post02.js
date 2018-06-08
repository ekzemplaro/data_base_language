// -----------------------------------------------------------------------
//	post02.js
//
//					Jun/03/2018
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** post02 *** start ***")

	button_click_monitor ()

	jQuery("#outarea_hh").text ("*** post02 *** end ***")

})

// -----------------------------------------------------------------------
// [4]:
function button_click_monitor ()
{
	jQuery ("button").click (function ()
		{
		jQuery("#outarea_bb").text (this.id)

		jQuery ("button").css ("color","black")
		jQuery ("#" + this.id).css ("color","blue")

		if (this.id == "enter")
			{
			enter_proc ()
			}
		})
}

// -----------------------------------------------------------------------
// [4-8]:
function enter_proc ()
{
	var str_out = ""

	const value_in = jQuery("#data").val()

	jQuery("#outarea_cc").text (value_in)

	const url = "./data_test.py"

	var params = {
		data_in: value_in,
		aa: 12,
		bb: 25,
		cc: 36,
		data_bb: "Hello"}

	const arg = {arg: JSON.stringify(params)}

	jQuery.post(url,arg,function(rec)
		{
		jQuery(".area_out").text (rec.message)
		jQuery("#outarea_dd").text (rec.message)
		})
}

// -----------------------------------------------------------------------
