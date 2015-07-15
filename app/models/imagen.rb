class Imagen < ActiveRecord::Base
	self.primary_key = :imagen_cod
	belongs_to :instanci, class_name: 'Instanci', foreign_key: 'ins_cod'
	belongs_to :instanci, class_name: 'Instanci', foreign_key: 'ins_cod_prov'
	validates :ins_cod, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :ins_cod_prov, presence: {message: "es requerido"}, format: {with: /\A[0-9]+\z/, message:"debe ser mayor o igual a 0"}
	validates :imagen_uri, presence: {message: "es requerido"}, uniqueness: {message: "ya existe"}
end
