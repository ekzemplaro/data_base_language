// ----------------------------------------------------------------------
//	photo.js
//
//							Jun/19/2017
// ----------------------------------------------------------------------
window.onload = function()
{
	var canvas = document.getElementById ("area_aa")

	var ctx = canvas.getContext('2d')

	var img = new Image()
	img.src = "./family-557100_1280.jpg"

	img.onload = function()
		{
		ctx.drawImage(img, 0, 0)

		ctx.lineWidth = 5
		ctx.strokeStyle = "rgb(0, 0, 255)"
		ctx.strokeRect (858,230,137,137)
		ctx.strokeRect (316,227,122,122)
		ctx.strokeRect (548,261,120,120)
		ctx.strokeRect (73,350,112,112)
		ctx.strokeRect (1026,358,108,108)
		}
}

// ----------------------------------------------------------------------
