json.array!(@detalle_documento_de_compras) do |detalle_documento_de_compra|
  json.extract! detalle_documento_de_compra, :id, :doc_com_cod, :det_doc_com_linea, :ins_cod, :ins_cod_prov, :det_doc_com_cant, :det_doc_com_precio, :det_doc_com_precio_uni
  json.url detalle_documento_de_compra_url(detalle_documento_de_compra, format: :json)
end
