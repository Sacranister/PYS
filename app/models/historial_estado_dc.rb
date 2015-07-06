class HistorialEstadoDc < ActiveRecord::Base
	self.primary_keys = :doc_com_cod, :est_dc_cod
end
