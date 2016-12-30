var app = angular.module('myApp', []);

app.controller('MainController', ['$scope', '$timeout', '$http', function($scope, $timeout, $http){
    $timeout(function() {
    $http.get('sample.json')
      .then(function(res) {
	console.log ('読み込み成功');
	console.log (res.data.list);
	$scope.items = res.data.list;
    })
    .catch (function(err) {
      alert('読み込み失敗');
    });
});

}]);
