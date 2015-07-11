class ArtProp < ActiveRecord::Base
	belongs_to :propiedad, foreign_key =>'prop_cod'
	belongs_to :articulo, foreign_key =>'art_cod'
end
