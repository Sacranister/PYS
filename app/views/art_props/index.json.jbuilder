json.array!(@art_props) do |art_prop|
  json.extract! art_prop, :id, :prop_cod, :art_cod
  json.url art_prop_url(art_prop, format: :json)
end
