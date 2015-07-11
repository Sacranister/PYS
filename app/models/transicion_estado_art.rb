class TransicionEstadoArt < ActiveRecord::Base
	self.primary_keys = :est_est_art_cod, :est_art_cod
	belongs_to :estado_articulo1, class_name: 'EstadoArticulo', foreign_key: 'est_est_art_cod'
	belongs_to :estado_articulo2, class_name: 'EstadoArticulo', foreign_key: 'est_art_cod'
end
