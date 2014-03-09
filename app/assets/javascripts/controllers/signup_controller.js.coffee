@app.controller "newUserCtrl", ["$scope", "User", ($scope, User) ->
  $scope.newUser = {
    beta: true
  }

  #$scope.formSubmitted = true
  #$scope.newUser = {
    #name: "Mike Silvis",
    #phone_number: "8145746139"
  #}

  $scope.addUser = ->
    _gaq.push(['_trackEvent', 'Signup Complete'])
    $scope.formSubmitted = true
    user = User.save $scope.newUser
]
