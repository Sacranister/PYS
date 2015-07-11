class HistorialEstadoDc < ActiveRecord::Base
	self.primary_keys = :doc_com_cod, :est_dc_cod
	belongs_to :documento_de_compra, foreign_key: 'doc_com_cod'
	belongs_to :estado_dc, foreign_key: 'est_dc_cod'
end
