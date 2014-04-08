@app.controller "newUserCtrl", ["$scope", "User", ($scope, User) ->
  $scope.newUser = {
    beta: true
    market_id: $('#default_market_id').val()
  }

  $scope.addUser = ->
    _gaq.push(['_trackEvent', 'CTA', 'Beta Signup'])

    $scope.formSubmitted = true
    user = User.save $scope.newUser
]
