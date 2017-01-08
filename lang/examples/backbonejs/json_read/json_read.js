var app = app || {}

//　config.jsonを読み込むオブジェクト
app.Config1 = Backbone.Model.extend({

    // .json ファイルのパスを設定
    url: './config1.json'
});


app.Config2 = Backbone.Model.extend({

    // .json ファイルのパスを設定
    url: './config2.json'
});


(function(){
    'use strict';
    var config1 = new app.Config1()
    var config2 = new app.Config2()

    config1.fetch().then( function() {

        app.config1 = config1

        return config2.fetch()

    }).then( function () {
    
        app.config2 = config2

        console.log( app.config1.get('app_name') )
        console.log( app.config1.get('version') )
        
        console.log( app.config2.get('MESSAGE_001') )
        console.log( app.config2.get('MESSAGE_002') )

	var str_out = ""
	str_out += app.config1.get('app_name') + '<br />'
	str_out += app.config1.get('version') + '<br />'
	str_out += app.config2.get('MESSAGE_001') + '<br />'
	str_out += app.config2.get('MESSAGE_002') + '<br />'

	jQuery (".contents").html (str_out)
    })

}())
