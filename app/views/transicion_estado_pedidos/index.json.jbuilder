json.array!(@transicion_estado_pedidos) do |transicion_estado_pedido|
  json.extract! transicion_estado_pedido, :id, :est_estado_ped_cod, :estado_ped_cod, :trans_est_ped_cod
  json.url transicion_estado_pedido_url(transicion_estado_pedido, format: :json)
end
