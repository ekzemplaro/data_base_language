// -----------------------------------------------------------------------
//
//	highlight_monitor.js
//
//					Nov/18/2015
// -----------------------------------------------------------------------
function highlight_monitor ()
{
	jQuery ("tr").each(function () {
	  jQuery(this).children().not('th').each(function (i) {
		i = i+1;
		jQuery(this).addClass("item" + i);
	  });
	});

	jQuery.fn.color = function() {
	  return this.each(function() {
		jQuery (this).css('background-color', '#eee');
	  });
	};

	jQuery ("tr").mouseout(function() {
		jQuery (this).children().css('background-color', '');
	});

	//列の背景色変更
	jQuery ("td").each(function() {
		var selector = '.'+ jQuery (this).attr('class');
		jQuery (this).hover(function(){
//		jQuery (selector).color();
		jQuery (this).siblings().color();
		//選択中のtdの背景色変更
		jQuery (this).css('background-color', '#ccc');
	  },function(){
		jQuery(selector).css('background-color', '');
		jQuery (this).parent().css('background-color', '');
	  });
	});
}

// -----------------------------------------------------------------------
