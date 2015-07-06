json.array!(@guia_despacho_compras) do |guia_despacho_compra|
  json.extract! guia_despacho_compra, :id, :doc_com_cod, :dir_cod, :guia_desp_fecha
  json.url guia_despacho_compra_url(guia_despacho_compra, format: :json)
end
