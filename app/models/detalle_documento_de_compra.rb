class DetalleDocumentoDeCompra < ActiveRecord::Base
	self.primary_keys = :doc_com_cod, :det_doc_com_linea
end
