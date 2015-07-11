class Cliente < ActiveRecord::Base
	self.primary_key = :cli_cod
	has_many :documento_de_compras
	has_many :solicitud_devolucions
	has_many :direccions
end
