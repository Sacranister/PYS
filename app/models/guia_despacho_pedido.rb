class GuiaDespachoPedido < ActiveRecord::Base
	self.primary_key = :guia_desp_ped_cod
	belongs_to :pedido, foreign_key: 'ped_cod'
end
