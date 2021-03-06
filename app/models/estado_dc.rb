class EstadoDc < ActiveRecord::Base
	self.primary_key = :est_dc_cod
	has_many :documento_de_compras, :dependent => :destroy, foreign_key: 'est_dc_cod'
	has_many :historial_estado_dcs, :dependent => :destroy, foreign_key: 'est_dc_cod'
	has_many :transicion_estado_dcs2, class_name: 'TransicionEstadoDc', foreign_key: 'est_dc_cod', :dependent => :destroy 
	has_many :transicion_estado_dcs1, class_name: 'TransicionEstadoDc', foreign_key: 'est_est_dc_cod', :dependent => :destroy 
	validates :est_dc_nom, presence: {message: "es requerido"}, uniqueness: {message: "ya existe"}
end
