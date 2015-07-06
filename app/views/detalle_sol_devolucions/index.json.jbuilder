json.array!(@detalle_sol_devolucions) do |detalle_sol_devolucion|
  json.extract! detalle_sol_devolucion, :id, :sol_dev_cod, :det_sol_dev_linea, :ins_cod, :ins_cod_prov, :det_sol_dev_cant, :det_sol_dev_precio
  json.url detalle_sol_devolucion_url(detalle_sol_devolucion, format: :json)
end
