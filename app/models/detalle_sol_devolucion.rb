class DetalleSolDevolucion < ActiveRecord::Base
	self.primary_keys = :sol_dev_cod, :det_sol_dev_linea
end
