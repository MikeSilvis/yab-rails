app = angular.module('Yab', ['ngResource'])

app.factory "User", ["$resource", ($resource) ->
  $resource("/api/v1/users/:id", {id: "@id"})
]

@newUserCtrl = ($scope, User) ->

  $scope.addUser = ->
    user = User.save $scope.newUser
    $scope.newUser = {}
