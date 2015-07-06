json.array!(@auditoris) do |auditori|
  json.extract! auditori, :id, :aud_usuario, :aud_fecha, :aud_tabla_modif, :aud_operacion, :aud_atri_modif, :aud_antes, :aud_despues
  json.url auditori_url(auditori, format: :json)
end
