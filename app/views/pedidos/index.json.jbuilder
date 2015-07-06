json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :estado_ped_cod, :guia_desp_ped_cod, :pro_cod, :ped_fecha
  json.url pedido_url(pedido, format: :json)
end
