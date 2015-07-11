class Propiedad < ActiveRecord::Base
	has_many :art_props
	has_many :art_prop_vals
	has_many :propiedad_valors
end
