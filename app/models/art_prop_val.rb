class ArtPropVal < ActiveRecord::Base
	self.primary_key = :apv_cod
	belongs_to :propiedad, foreign_key: 'prop_cod'
	belongs_to :valor, foreign_key: 'val_cod'
	belongs_to :articulo, foreign_key: 'art_cod'
	has_many :ins_apvs, :dependent => :destroy, foreign_key: 'apv_cod'
end
