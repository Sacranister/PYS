json.array!(@estado_articulos) do |estado_articulo|
  json.extract! estado_articulo, :id, :est_art_nom
  json.url estado_articulo_url(estado_articulo, format: :json)
end
