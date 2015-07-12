class DocumentoDeCompra < ActiveRecord::Base
	self.primary_key = :doc_com_cod
	belongs_to :cliente, foreign_key: 'cli_cod'
	belongs_to :estado_dc, foreign_key: 'est_dc_cod'
	belongs_to :vendedor, foreign_key: 'ven_cod'
	has_one :guia_despacho_compra, foreign_key: 'guia_desp_cod'
	has_one :documento_de_cobro, foreign_key: 'doc_cob_cod'
	has_many :detalle_documento_de_compras, :dependent => :destroy, foreign_key: 'doc_com_cod' 
	has_many :historial_estado_dcs, :dependent => :destroy, foreign_key: 'doc_com_cod' 
	has_many :solicitud_devolucions, :dependent => :destroy, foreign_key: 'doc_com_cod' 
end
