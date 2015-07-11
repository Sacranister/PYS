class ArtProp < ActiveRecord::Base
	self.primary_key = :art_prop_cod 
	belongs_to :propiedad, foreign_key:'prop_cod'
	belongs_to :articulo, foreign_key:'art_cod'
end
