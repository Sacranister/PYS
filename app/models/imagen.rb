class Imagen < ActiveRecord::Base
	self.primary_key = :imagen_cod
	belongs_to :ins_cod, class_name: 'Instanci', foreign_key: 'ins_cod'
	belongs_to :ins_cod_prov, class_name: 'Instanci', foreign_key: 'ins_cod_prov'
end
