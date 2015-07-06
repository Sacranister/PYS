json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :cli_nom, :cli_tel, :cli_mail, :cli_rut
  json.url cliente_url(cliente, format: :json)
end
