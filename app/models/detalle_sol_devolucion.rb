class DetalleSolDevolucion < ActiveRecord::Base
	self.primary_keys = :sol_dev_cod, :det_sol_dev_linea
	belongs_to :solicitud_devolucion, foreign_key => 'sol_dev_cod'
	belongs_to :instanci, foreign_key => 'ins_cod'
end
