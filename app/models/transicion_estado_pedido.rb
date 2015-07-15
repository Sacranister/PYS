class TransicionEstadoPedido < ActiveRecord::Base
	self.primary_keys = :est_estado_ped_cod, :estado_ped_cod, :trans_est_ped_cod
	belongs_to :estado_pedido1, class_name: 'EstadoPedido', foreign_key: 'est_estado_ped_cod'
	belongs_to :estado_pedido2, class_name: 'EstadoPedido', foreign_key: 'estado_ped_cod'
	validates :est_estado_ped_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :estado_ped_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :trans_est_ped_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
end
