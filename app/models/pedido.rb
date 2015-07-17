class Pedido < ActiveRecord::Base
	self.primary_key = :ped_cod
	belongs_to :proveedor, foreign_key: 'pro_cod'
	belongs_to :estado_pedido, foreign_key: 'estado_ped_cod'
	has_one :guia_despacho_pedido, foreign_key: 'ped_cod', :dependent => :destroy
	has_many :detalle_pedidos, :dependent => :destroy, foreign_key: 'ped_cod'
	has_many :historial_estado_pedidos, :dependent => :destroy, foreign_key: 'ped_cod'
	accepts_nested_attributes_for :detalle_pedidos, :reject_if => :all_blank, :allow_destroy => true
	validates :pro_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :ped_fecha, presence: {message: "es requerido"}
	#validates :estado_pedido, presence: {message: "es requerido"}
end
