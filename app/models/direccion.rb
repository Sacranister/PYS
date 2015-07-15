class Direccion < ActiveRecord::Base
	self.primary_key = :dir_cod
	belongs_to :cliente, foreign_key: 'cli_cod'
	belongs_to :guia_despacho_compra, foreign_key: 'guia_desp_cod'
	validates :dir_calle, presence: {message: "es requerido"}
	validates :dir_numero, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :dir_comuna, presence: {message: "es requerido"}
	validates :dir_ciudad, presence: {message: "es requerido"}
end
