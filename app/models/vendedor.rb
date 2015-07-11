class Vendedor < ActiveRecord::Base
	self.primary_key = :ven_cod
	has_many :solicitud_devolucions
	has_many :documento_de_compras
end
