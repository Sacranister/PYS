class Direccion < ActiveRecord::Base
	self.primary_key = :dir_cod
	belongs_to :cliente, foreign_key => 'cli_cod'
	belongs_to :guia_despacho_compra, foreign_key: 'guia_desp_cod'
end
