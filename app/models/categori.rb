class Categori < ActiveRecord::Base
	self.primary_key = :cat_cod
	has_many :articulos, :dependent => :destroy, foreign_key: 'cat_cod'
	has_many :subcategorias, class_name: 'Categori', foreign_key: 'cat_cat_cod', :dependent => :destroy 
	validates :cat_nom, presence: {message: "es requerido"}, uniqueness: {message: "ya existe"}
end
