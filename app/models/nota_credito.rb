class NotaCredito < ActiveRecord::Base
	self.primary_key = :not_cre_cod
	belongs_to :solicitud_devolucion, foreign_key: 'sol_dev_cod'
	belongs_to :documento_de_cobro, foreign_key: 'doc_cob_cod'
end
