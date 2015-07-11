class EstadoArticulo < ActiveRecord::Base
	has_many :transicion_estado_arts1, class_name => 'TransicionEstadoArt', foreign_key => 'est_est_art_cod'
	has_many :transicion_estado_arts2, class_name => 'TransicionEstadoArt', foreign_key => 'est_art_cod'
	has_many :instancis
end
