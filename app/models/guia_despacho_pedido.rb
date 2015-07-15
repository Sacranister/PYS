class GuiaDespachoPedido < ActiveRecord::Base
	self.primary_key = :guia_desp_ped_cod
	has_one :pedido, foreign_key: 'ped_cod'
end
