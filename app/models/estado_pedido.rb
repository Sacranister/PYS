class EstadoPedido < ActiveRecord::Base
	has_many :pedidos
	has_many :historial_estado_pedidos
	has_many :transicion_estado_pedido1, class_name: 'TransicionEstadoPedido', foreign_key: 'est_estado_ped_cod'
	has_many :transicion_estado_pedido2, class_name: 'TransicionEstadoPedido', foreign_key: 'estado_ped_cod'
end
