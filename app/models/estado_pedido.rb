class EstadoPedido < ActiveRecord::Base
	self.primary_key = :estado_ped_cod
	has_many :pedidos, :dependent => :destroy, foreign_key: 'est_ped_cod' 
	has_many :historial_estado_pedidos, :dependent => :destroy, foreign_key: 'est_ped_cod' 
	has_many :transicion_estado_pedido1, class_name: 'TransicionEstadoPedido', foreign_key: 'est_estado_ped_cod', :dependent => :destroy 
	has_many :transicion_estado_pedido2, class_name: 'TransicionEstadoPedido', foreign_key: 'estado_ped_cod', :dependent => :destroy 
	validates :estado_ped_nom, presence: {message: "es requerido"},  uniqueness: {message: "ya existe"}
end
