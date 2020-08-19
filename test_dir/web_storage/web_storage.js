// ---------------------------------------------------------------
//	test.js
//
//					Aug/15/2020
//
// ---------------------------------------------------------------
jQuery(function()
{
	jQuery('#saveButton').click(function(){

		if(window.localStorage){
			var ss = jQuery('#text1').val()
			localStorage.setItem("key1", ss)
			jQuery('#text1').val("")
		}

	})

	jQuery('#readButton').click(function(){

		if(window.localStorage){
			value = localStorage.getItem("key1")
			jQuery(".message").text(value)
//			alert( localStorage.getItem("key1") );
		}

	})
})

// ---------------------------------------------------------------
