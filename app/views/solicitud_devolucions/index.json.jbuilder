json.array!(@solicitud_devolucions) do |solicitud_devolucion|
  json.extract! solicitud_devolucion, :id, :not_cre_cod, :doc_com_cod, :ven_cod, :cli_cod, :sol_dev_comentario, :sol_dev_est
  json.url solicitud_devolucion_url(solicitud_devolucion, format: :json)
end
