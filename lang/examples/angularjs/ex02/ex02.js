var app = angular.module('myApp', [])
app.controller('myController', function() {
    this.members = [
        { name: 'Tanaka', age: 36 },
        { name: 'Suzuki', age: 16 },
        { name: 'Yamada', age: 26 },
        { name: 'Satoh', age: 19 },
        { name: 'Noda', age: 38 }
    ]
})
