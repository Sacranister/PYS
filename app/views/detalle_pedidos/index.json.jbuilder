json.array!(@detalle_pedidos) do |detalle_pedido|
  json.extract! detalle_pedido, :id, :ped_cod, :det_ped_linea, :ins_cod, :ins_cod_prov, :det_ped_cant, :det_ped_precio
  json.url detalle_pedido_url(detalle_pedido, format: :json)
end
