class Cliente < ActiveRecord::Base
	self.primary_key = :cli_cod
	has_many :documento_de_compras, :dependent => :destroy, foreign_key: 'cli_cod' 
	has_many :solicitud_devolucions, :dependent => :destroy, foreign_key: 'cli_cod'
	has_many :direccions, :dependent => :destroy, foreign_key: 'cli_cod'
end
