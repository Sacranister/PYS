class DetallePedido < ActiveRecord::Base
	self.primary_keys = :ped_cod, :det_ped_linea
	belongs_to :instanci, foreign_key => 'ins_cod'
	belongs_to :pedido, foreign_key => 'ped_cod'
end
