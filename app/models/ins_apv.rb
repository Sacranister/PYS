class InsApv < ActiveRecord::Base
	belongs_to :ins_cod, class_name: 'Instanci', foreign_key: 'ins_cod'
	belongs_to :ins_cod_prov, class_name: 'Instanci', foreign_key: 'ins_cod_prov'
	belongs_to :art_prop_val, foreign_key: 'apv_cod'
end
