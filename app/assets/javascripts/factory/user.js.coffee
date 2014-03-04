@app.factory "User", ["$resource", ($resource) ->
  $resource("/api/v1/users/:id", {id: "@id"})
]
