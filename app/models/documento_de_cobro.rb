class DocumentoDeCobro < ActiveRecord::Base
	self.primary_key = :doc_cob_cod
	belongs_to :documento_de_compra, foreign_key: 'doc_com_cod'
	has_one :nota_credito, foreign_key: 'not_cre_cod'
	validates :not_cre_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"Not cre cod debe ser mayor o igual a 0"}
	validates :doc_com_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"Doc com cod debe ser mayor o igual a 0"}
	validates :doc_cob_tipo, presence: {message: "es requerido"}
end
