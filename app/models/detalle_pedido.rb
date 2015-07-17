class DetallePedido < ActiveRecord::Base
	self.primary_keys = :ped_cod, :det_ped_linea
	belongs_to :instanci, foreign_key: 'ins_cod'
	belongs_to :pedido, foreign_key: 'ped_cod'
	#validates :ped_cod, presence: {message: "es requerido"}
	validates :det_ped_linea, presence: {message: "es requerido"}
	validates :ins_cod, presence: {message: "es requerido"}
	validates :det_ped_cant, presence: {message: "es requerido"}
	#validates :ins_cod_prov, presence: {message: "es requerido"}
end
