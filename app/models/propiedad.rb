class Propiedad < ActiveRecord::Base
	self.primary_key = :prop_cod
	has_many :art_props, :dependent => :destroy 
	has_many :art_prop_vals, :dependent => :destroy 
	has_many :propiedad_valors, :dependent => :destroy 
end
