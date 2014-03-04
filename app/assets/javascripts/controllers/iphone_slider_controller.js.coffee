@app.controller "iphoneSliderCtrl", ["$scope", ($scope) ->
  $scope.intervalTimer = 5000
  $scope.slides = []

  $scope.slides.push {
    image: 'assets/landing/iphone5yab2.png'
  }
]
