class Proveedor < ActiveRecord::Base
	self.primary_key = :pro_cod
	has_many :pedidos, :dependent => :destroy, foreign_key: 'pro_cod' 
	validates :pro_nom, presence: {message: "es requerido"},  uniqueness: {message: "ya existe"}
	validates :pro_mail, presence: {message: "es requerido"},  uniqueness: {message: "ya existe"} ,format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message:"El formato del correo es invalido"}
end
