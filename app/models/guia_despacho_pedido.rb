class GuiaDespachoPedido < ActiveRecord::Base
	belongs_to :pedido, foreign_key => 'ped_cod'
end
