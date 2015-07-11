class PropiedadValor < ActiveRecord::Base
	belongs_to :valor, foreign_key: 'val_cod'
	belongs_to :propiedad, foreign_key: 'prop_cod'
end
