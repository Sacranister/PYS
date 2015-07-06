json.array!(@estado_pedidos) do |estado_pedido|
  json.extract! estado_pedido, :id, :estado_ped_nom
  json.url estado_pedido_url(estado_pedido, format: :json)
end
