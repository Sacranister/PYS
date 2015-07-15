class DocumentoDeCobro < ActiveRecord::Base
	self.primary_key = :doc_cob_cod
	belongs_to :documento_de_compra, foreign_key: 'doc_com_cod'
	has_one :nota_credito, foreign_key: 'not_cre_cod'	
end
