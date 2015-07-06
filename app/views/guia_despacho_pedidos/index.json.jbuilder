json.array!(@guia_despacho_pedidos) do |guia_despacho_pedido|
  json.extract! guia_despacho_pedido, :id, :ped_cod, :guia_desp_ped_fecha
  json.url guia_despacho_pedido_url(guia_despacho_pedido, format: :json)
end
