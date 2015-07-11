class Vendedor < ActiveRecord::Base
	has_many :solicitud_devolucions
	has_many :documento_de_compras
end
