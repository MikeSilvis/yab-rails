@app.controller 'mapCtrl', ['$scope', ($scope) ->
  handler = Gmaps.build('Google')
  handler.buildMap
    internal:
      id: 'multi_markers'
  , ->
    marker = handler.addMarkers($('#multi_markers').data('locations'))
    handler.bounds.extendWith marker
    handler.fitMapToBounds()
]
