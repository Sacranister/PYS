class SolicitudDevolucion < ActiveRecord::Base
	self.primary_key = :sol_dev_cod
	belongs_to :cliente, foreign_key: 'cli_cod'
	belongs_to :vendedor, foreign_key: 'ven_cod'
	has_one :nota_credito, foreign_key: 'not_cre_cod'
	belongs_to :documento_de_compra, foreign_key: 'doc_com_cod'
	has_many :detalle_sol_devolucions
end
