app.factory "Patient", ["$resource", ($resource) ->
  $resource(
    "/patients_data.json",
    {}
    {
      index:   { method: 'GET', isArray: true },
    }
  )
]