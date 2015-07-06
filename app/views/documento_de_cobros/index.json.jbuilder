json.array!(@documento_de_cobros) do |documento_de_cobro|
  json.extract! documento_de_cobro, :id, :not_cre_cod, :doc_com_cod, :doc_cob_tipo
  json.url documento_de_cobro_url(documento_de_cobro, format: :json)
end
