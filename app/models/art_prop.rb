class ArtProp < ActiveRecord::Base
	self.primary_key = :art_prop_cod 
	belongs_to :propiedad, foreign_key:'prop_cod'
	belongs_to :articulo, foreign_key:'art_cod'
	#validates :prop_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	#validates :art_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
end
