class EstadoDc < ActiveRecord::Base
	has_many :documento_de_compras
	has_many :historial_estado_dcs
	has_many :transicion_estado_dcs2, class_name: 'TransicionEstadoDc', foreign_key: 'est_dc_cod'
	has_many :transicion_estado_dcs1, class_name: 'TransicionEstadoDc', foreign_key: 'est_est_dc_cod'
end
