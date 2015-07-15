class NotaCredito < ActiveRecord::Base
	self.primary_key = :not_cre_cod
	belongs_to :solicitud_devolucion, foreign_key: 'sol_dev_cod'
	belongs_to :documento_de_cobro, foreign_key: 'doc_cob_cod'
	validates :sol_dev_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :doc_cob_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :not_cre_monto, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
end
