class Cliente < ActiveRecord::Base
	has_many :documento_de_compras
	has_many :solicitud_devolucions
	has_many :direccions
end
