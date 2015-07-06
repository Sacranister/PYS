json.array!(@art_prop_vals) do |art_prop_val|
  json.extract! art_prop_val, :id, :val_cod, :art_cod, :prop_cod
  json.url art_prop_val_url(art_prop_val, format: :json)
end
