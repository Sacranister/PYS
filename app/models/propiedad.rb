class Propiedad < ActiveRecord::Base
	self.primary_key = :prop_cod
	has_many :art_props, :dependent => :destroy, foreign_key: 'prop_cod' 
	has_many :art_prop_vals, :dependent => :destroy, foreign_key: 'prop_cod' 
	has_many :propiedad_valors, :dependent => :destroy, foreign_key: 'prop_cod' 
	has_many :valors, :through => :propiedad_valors
	accepts_nested_attributes_for :propiedad_valors, :allow_destroy => true
	accepts_nested_attributes_for :valors, :allow_destroy => true
	validates :prop_nom, presence: true, uniqueness: {message: "ya existe"}
end
