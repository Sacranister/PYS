json.array!(@documento_de_compras) do |documento_de_compra|
  json.extract! documento_de_compra, :id, :est_dc_cod, :ven_cod, :guia_desp_cod, :cli_cod, :doc_cob_cod, :doc_com_fecha, :doc_com_met_ent, :doc_com_met_pago, :doc_com_tipo
  json.url documento_de_compra_url(documento_de_compra, format: :json)
end
