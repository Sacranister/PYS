json.array!(@estado_dcs) do |estado_dc|
  json.extract! estado_dc, :id, :est_dc_nom
  json.url estado_dc_url(estado_dc, format: :json)
end
