class HistorialEstadoPedido < ActiveRecord::Base
	self.primary_keys = :ped_cod, :estado_ped_cod
	belongs_to :pedido, foreign_key: 'ped_cod'
	belongs_to :estado_pedido, foreign_key: 'estado_ped_cod'
end
