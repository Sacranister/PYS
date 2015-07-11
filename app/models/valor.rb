class Valor < ActiveRecord::Base
	self.primary_key = :val_cod
	has_many :art_prop_vals
	has_many :propiedad_valors
end
