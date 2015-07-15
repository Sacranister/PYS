class Articulo < ActiveRecord::Base
	self.primary_key = :art_cod
	has_many :art_props, :dependent => :destroy, foreign_key: 'art_cod'
	has_many :instancis, :dependent => :destroy, foreign_key: 'art_cod'
	has_many :art_prop_vals, :dependent => :destroy, foreign_key: 'art_cod'
	belongs_to :categori, foreign_key: 'cat_cod'
	accepts_nested_attributes_for :art_prop_vals, :reject_if => :all_blank, :allow_destroy => true
	validates :cat_cod, presence: true
	validates :art_nom, presence: true
end
