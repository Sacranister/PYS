class TransicionEstadoPedido < ActiveRecord::Base
	belongs_to :estado_pedido1, class_name: 'EstadoPedido', foreign_key: 'est_estado_ped_cod'
	belongs_to :estado_pedido2, class_name: 'EstadoPedido', foreign_key: 'estado_ped_cod'
end
