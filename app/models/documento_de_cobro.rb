class DocumentoDeCobro < ActiveRecord::Base
	belongs_to :documento_de_compra, foreign_key: 'doc_com_cod'
	has_one :nota_credito, foreign_key: 'not_cre_cod'
end
