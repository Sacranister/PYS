json.array!(@imagens) do |imagen|
  json.extract! imagen, :id, :ins_cod, :ins_cod_prov, :imagen_uri
  json.url imagen_url(imagen, format: :json)
end
