json.array!(@propiedads) do |propiedad|
  json.extract! propiedad, :id, :prop_nom
  json.url propiedad_url(propiedad, format: :json)
end
