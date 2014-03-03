app = angular.module('Yab', ['ngResource'])

app.factory "User", ["$resource", ($resource) ->
  $resource("/api/v1/users/:id", {id: "@id"})
]

@newUserCtrl = ($scope, User) ->
  $scope.formSubmitted = false

  #$scope.formSubmitted = true
  #$scope.newUser = {
    #name: "Mike Silvis",
    #phone_number: "8145746139"
  #}

  $scope.addUser = ->
    $scope.formSubmitted = true
    $scope.newUser.beta = true
    user = User.save $scope.newUser
