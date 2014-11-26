app.factory "Patient", ["$resource", ($resource) ->
  $resource(
    "/patients_data.json",
    {}
    {
      index:   { method: 'GET', isArray: true },
      update: { method: 'POST' }
    }
  )
]

app.factory "userData", ["$resource", ($resource) ->
  $resource(
    "/set_current_patient/:id.json",
    {id: @id}
    {
      update: { method: 'POST' }
    }
  )
]