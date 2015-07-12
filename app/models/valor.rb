class Valor < ActiveRecord::Base
	self.primary_key = :val_cod
	has_many :art_prop_vals, :dependent => :destroy, foreign_key: 'val_cod'  
	has_many :propiedad_valors, :dependent => :destroy, foreign_key: 'val_cod'  
end
