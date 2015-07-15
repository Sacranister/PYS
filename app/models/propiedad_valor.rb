class PropiedadValor < ActiveRecord::Base
	self.primary_key = :prop_val_cod
	belongs_to :valor, foreign_key: 'val_cod'
	belongs_to :propiedad,foreign_key: 'prop_cod'
	accepts_nested_attributes_for :valor, :reject_if => :all_blank, :allow_destroy => true
	#validates :val_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	#validates :prop_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
end
