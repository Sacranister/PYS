class Categori < ActiveRecord::Base
	self.primary_key = :cat_cod
	has_many :articulos
	has_many :subcategorias, class_name: 'Categori', foreign_key: 'cat_cat_cod'
end
