@app.controller 'mapCtrl', ['$scope', ($scope) ->
  handler = Gmaps.build('Google')
  handler.buildMap
    internal:
      id: 'multi_markers'
  , ->
    handler.bounds.extendWith handler.addMarkers($('#multi_markers').data('locations'))
    handler.fitMapToBounds()
]
