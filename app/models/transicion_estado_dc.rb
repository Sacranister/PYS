class TransicionEstadoDc < ActiveRecord::Base
	self.primary_keys = :est_dc_cod, :est_est_dc_cod, :trans_est_dc_cod
	belongs_to :estado_dc2, class_name: 'EstadoDc', foreign_key: 'est_dc_cod'
	belongs_to :estado_dc1, class_name: 'EstadoDc', foreign_key: 'est_est_dc_cod'
	validates :est_dc_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :est_est_dc_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :trans_est_dc_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
end
