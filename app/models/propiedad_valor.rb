class PropiedadValor < ActiveRecord::Base
	self.primary_key = :prop_val_cod
	belongs_to :valor, foreign_key: 'val_cod'
	belongs_to :propiedad,foreign_key: 'prop_cod'
	accepts_nested_attributes_for :valor
end
