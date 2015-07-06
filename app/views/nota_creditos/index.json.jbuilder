json.array!(@nota_creditos) do |nota_credito|
  json.extract! nota_credito, :id, :sol_dev_cod, :doc_cob_cod, :not_cre_monto
  json.url nota_credito_url(nota_credito, format: :json)
end
