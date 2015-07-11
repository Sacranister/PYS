class Propiedad < ActiveRecord::Base
	self.primary_key = :prop_cod
	has_many :art_props
	has_many :art_prop_vals
	has_many :propiedad_valors
end
