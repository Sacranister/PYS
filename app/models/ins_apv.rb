class InsApv < ActiveRecord::Base
	self.primary_key = :ins_apvs_cod
	belongs_to :instanci, class_name: 'Instanci', foreign_key: 'ins_cod'
	belongs_to :art_prop_val, foreign_key: 'apv_cod'
	#validates :ins_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	#validates :ins_cod_prov, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	#validates :apv_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
end
