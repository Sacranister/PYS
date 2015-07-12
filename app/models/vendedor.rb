class Vendedor < ActiveRecord::Base
	self.primary_key = :ven_cod
	has_many :solicitud_devolucions, :dependent => :destroy 
	has_many :documento_de_compras, :dependent => :destroy 
end
