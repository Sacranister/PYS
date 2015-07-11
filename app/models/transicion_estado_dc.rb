class TransicionEstadoDc < ActiveRecord::Base
	self.primary_keys = :est_dc_cod, :est_est_dc_cod
	belongs_to :estado_dc2, class_name => 'EstadoDc', foreign_key => 'est_dc_cod'
	belongs_to :estado_dc1, class_name => 'EstadoDc', foreign_key => 'est_est_dc_cod'
end
