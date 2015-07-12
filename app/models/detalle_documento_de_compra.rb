class DetalleDocumentoDeCompra < ActiveRecord::Base
	self.primary_keys = :doc_com_cod, :det_doc_com_linea
	belongs_to :documento_de_compra, foreign_key: 'doc_com_cod'
	belongs_to :instanci, class_name: 'Instanci', foreign_key: 'ins_cod'
	belongs_to :instanci, class_name: 'Instanci', foreign_key: 'ins_cod_prov'
end
