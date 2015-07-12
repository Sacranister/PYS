class Cliente < ActiveRecord::Base
	self.primary_key = :cli_cod
	has_many :documento_de_compras, :dependent => :destroy 
	has_many :solicitud_devolucions, :dependent => :destroy 
	has_many :direccions, :dependent => :destroy 
end
