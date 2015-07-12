class Imagen < ActiveRecord::Base
	self.primary_key = :imagen_cod
	belongs_to :instanci, class_name: 'Instanci', foreign_key: 'ins_cod'
	belongs_to :instanci, class_name: 'Instanci', foreign_key: 'ins_cod_prov'
end
