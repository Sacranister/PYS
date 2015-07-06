class DetallePedido < ActiveRecord::Base
	self.primary_keys = :ped_cod, :det_ped_linea
end
