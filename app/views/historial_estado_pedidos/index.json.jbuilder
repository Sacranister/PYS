json.array!(@historial_estado_pedidos) do |historial_estado_pedido|
  json.extract! historial_estado_pedido, :id, :ped_cod, :estado_ped_cod, :hist_est_ped_cod, :hist_est_ped_fecha
  json.url historial_estado_pedido_url(historial_estado_pedido, format: :json)
end
