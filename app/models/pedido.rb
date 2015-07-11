class Pedido < ActiveRecord::Base
	belongs_to :proveedor, foreign_key: 'pro_cod'
	belongs_to :estado_pedido, foreign_key: 'estado_ped_cod'
	has_one :guia_despacho_pedido, foreign_key: 'guia_desp_ped_cod'
	has_many :detalle_pedidos
	has_many :historial_estado_pedidos
end
