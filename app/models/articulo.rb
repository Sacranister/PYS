class Articulo < ActiveRecord::Base
	has_many :art_props
	has_many :instancis
	has_many :art_prop_vals
	belongs_to :categori, foreign_key: 'cat_cod'
end
