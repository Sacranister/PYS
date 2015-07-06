json.array!(@historial_estado_dcs) do |historial_estado_dc|
  json.extract! historial_estado_dc, :id, :doc_com_cod, :est_dc_cod, :hist_est_dc_cod, :hist_est_dc_fecha
  json.url historial_estado_dc_url(historial_estado_dc, format: :json)
end
