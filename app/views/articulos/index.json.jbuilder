json.array!(@articulos) do |articulo|
  json.extract! articulo, :id, :cat_cod, :art_nom
  json.url articulo_url(articulo, format: :json)
end
