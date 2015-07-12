class Articulo < ActiveRecord::Base
	self.primary_key = :art_cod
	has_many :art_props, :dependent => :destroy, foreign_key: 'art_cod'
	has_many :instancis, :dependent => :destroy, foreign_key: 'art_cod'
	has_many :art_prop_vals, :dependent => :destroy, foreign_key: 'art_cod'
	belongs_to :categori, foreign_key: 'cat_cod'
end
