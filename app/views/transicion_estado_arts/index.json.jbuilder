json.array!(@transicion_estado_arts) do |transicion_estado_art|
  json.extract! transicion_estado_art, :id, :est_est_art_cod, :est_art_cod, :trans_est_art_cod
  json.url transicion_estado_art_url(transicion_estado_art, format: :json)
end
