json.array!(@categoris) do |categori|
  json.extract! categori, :id, :cat_cat_cod, :cat_nom
  json.url categori_url(categori, format: :json)
end
