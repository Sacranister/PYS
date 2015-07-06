json.array!(@vendedors) do |vendedor|
  json.extract! vendedor, :id, :ven_nom, :ven_rut, :ven_mail, :ven_tel
  json.url vendedor_url(vendedor, format: :json)
end
