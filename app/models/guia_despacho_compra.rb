class GuiaDespachoCompra < ActiveRecord::Base
	self.primary_key = :guia_desp_cod
	belongs_to :documento_de_compra, foreign_key: 'doc_com_cod'
	has_one :direccion, foreign_key: 'dir_cod'
end