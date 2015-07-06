json.array!(@direccions) do |direccion|
  json.extract! direccion, :id, :cli_cod, :guia_desp_cod, :dir_calle, :dir_numero, :dir_comuna, :dir_ciudad, :dir_tipo
  json.url direccion_url(direccion, format: :json)
end
