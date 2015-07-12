class Articulo < ActiveRecord::Base
	self.primary_key = :art_cod
	has_many :art_props, :dependent => :destroy 
	has_many :instancis, :dependent => :destroy 
	has_many :art_prop_vals, :dependent => :destroy 
	belongs_to :categori, foreign_key: 'cat_cod'
end
