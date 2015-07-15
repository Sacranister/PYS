class EstadoArticulo < ActiveRecord::Base
	self.primary_key = :est_art_cod
	has_many :transicion_estado_arts1, class_name: 'TransicionEstadoArt', foreign_key: 'est_est_art_cod', :dependent => :destroy 
	has_many :transicion_estado_arts2, class_name: 'TransicionEstadoArt', foreign_key: 'est_art_cod', :dependent => :destroy 
	has_many :instancis, :dependent => :destroy 
	validates :est_art_nom, presence: {message: "es requerido"},  uniqueness: {message: "ya existe"}
end
