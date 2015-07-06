class HistorialEstadoPedido < ActiveRecord::Base
	self.primary_keys = :ped_cod, :estado_ped_cod
end
