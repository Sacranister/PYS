class TransicionEstadoArt < ActiveRecord::Base
	self.primary_keys = :est_est_art_cod, :est_art_cod, :trans_est_art_cod
	belongs_to :estado_articulo1, class_name: 'EstadoArticulo', foreign_key: 'est_est_art_cod'
	belongs_to :estado_articulo2, class_name: 'EstadoArticulo', foreign_key: 'est_art_cod'
	validates :est_est_art_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :est_art_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :trans_est_art_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
end
