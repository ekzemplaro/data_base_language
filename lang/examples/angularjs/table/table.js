var app = angular.module('myApp', [])
app.controller('myController', function() {
this.members = [
	{ name: '田中', age: 36 },
	{ name: '鈴木', age: 16 },
	{ name: '山田', age: 26 },
	{ name: '佐藤', age: 19 },
	{ name: '野田', age: 38 },
	{ name: '安倍', age: 43 }
	]
})
