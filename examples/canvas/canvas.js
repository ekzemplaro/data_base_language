// -----------------------------------------------------------------
//	canvas.js
//
//					Sep/12/2016
// -----------------------------------------------------------------
jQuery (function ()
{
	var canvas = document.getElementById('c2');
	if ( ! canvas || ! canvas.getContext ) { return false; }
	var ctx = canvas.getContext('2d');

	draw2 (ctx)

	draw_string_proc (ctx)

	line_proc (ctx)
})

// -----------------------------------------------------------------
function draw2 (ctx)
{
	ctx.beginPath ()
	ctx.strokeRect (20, 20, 80, 40)
	ctx.strokeRect (120, 20, 180, 40)
	ctx.strokeRect (220, 70, 280, 110)

}

// -----------------------------------------------------------------
function draw_string_proc (ctx)
{
	/* フォントスタイルを定義 */
// ctx.font = "18px 'ＭＳ Ｐゴシック'";
// ctx.font = "12px 'Times New Roman'"
// ctx.font = "italic bold 20px sans-serif"
ctx.font = "bold 14px 'ＭＳ 明朝'"
/* 青色でstrokText */
ctx.strokeStyle = "blue";
ctx.strokeText("青色でstrokText", 10, 125);
/* maxLengthをセット */
ctx.strokeText("maxLengthをセット", 10, 150, 80);
/* 赤色でfillText */
ctx.fillStyle = "red";
ctx.fillText("赤色でfillText", 10, 175);
/* maxLengthをセット */
ctx.fillText("maxLengthをセット", 10, 200, 80);


ctx.strokeStyle = "black";
ctx.strokeText("黒色でstrokText", 15, 225);
}

// -----------------------------------------------------------------
function line_proc (ctx)
{
	ctx.beginPath ()

	ctx.lineWidth = 2.0
	ctx.setLineDash ([10,5])
	ctx.moveTo (120 ,  120 )
	ctx.lineTo (220 ,  220 )
	ctx.stroke ()
}

// -----------------------------------------------------------------
