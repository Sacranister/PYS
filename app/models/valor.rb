class Valor < ActiveRecord::Base
	has_many :art_prop_vals
	has_many :propiedad_valors
end
