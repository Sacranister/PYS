json.array!(@propiedad_valors) do |propiedad_valor|
  json.extract! propiedad_valor, :id, :val_cod, :prop_cod
  json.url propiedad_valor_url(propiedad_valor, format: :json)
end
