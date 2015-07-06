json.array!(@transicion_estado_dcs) do |transicion_estado_dc|
  json.extract! transicion_estado_dc, :id, :est_est_dc_cod, :est_dc_cod, :trans_est_dc_cod
  json.url transicion_estado_dc_url(transicion_estado_dc, format: :json)
end
