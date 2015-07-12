class Propiedad < ActiveRecord::Base
	self.primary_key = :prop_cod
	has_many :art_props, :dependent => :destroy, foreign_key: 'prop_cod' 
	has_many :art_prop_vals, :dependent => :destroy, foreign_key: 'prop_cod' 
	has_many :propiedad_valors, :dependent => :destroy, foreign_key: 'prop_cod'  
end
