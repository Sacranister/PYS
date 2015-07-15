class InsApv < ActiveRecord::Base
	self.primary_key = :ins_apvs_cod
	belongs_to :instanci, class_name: 'Instanci', foreign_key: 'ins_cod'
	belongs_to :art_prop_val, foreign_key: 'apv_cod'
end
