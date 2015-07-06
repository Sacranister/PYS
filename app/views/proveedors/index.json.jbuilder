json.array!(@proveedors) do |proveedor|
  json.extract! proveedor, :id, :pro_nom, :pro_mail, :pro_desc, :pro_web
  json.url proveedor_url(proveedor, format: :json)
end
