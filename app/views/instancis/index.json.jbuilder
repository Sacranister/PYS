json.array!(@instancis) do |instanci|
  json.extract! instanci, :id, :ins_cod, :ins_cod_prov, :est_art_cod, :art_cod, :ins_stock, :ins_precio_lista, :ins_precio_prov
  json.url instanci_url(instanci, format: :json)
end
