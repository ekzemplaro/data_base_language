jQuery(function() {
    var MyView = Backbone.View.extend({
        render: function() {
		var str_out = 'Hello View!!<br />'
		str_out += 'Good Morning!!<br />'
		str_out += 'こんにちは<br />'
		str_out += 'おはよう<br />'
            this.$el.html(str_out)
            return this
        }
    })

    var myView = new MyView()

    jQuery('.contents').append(myView.render().el)
})


