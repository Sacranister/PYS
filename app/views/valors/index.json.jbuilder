json.array!(@valors) do |valor|
  json.extract! valor, :id, :val_nom
  json.url valor_url(valor, format: :json)
end
