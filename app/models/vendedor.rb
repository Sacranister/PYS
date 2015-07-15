class Vendedor < ActiveRecord::Base
	self.primary_key = :ven_cod
	has_many :solicitud_devolucions, :dependent => :destroy, foreign_key: 'ven_cod'  
	has_many :documento_de_compras, :dependent => :destroy, foreign_key: 'ven_cod'  
	validates :ven_nom, presence: {message: "es requerido"}
	validates :ven_mail, uniqueness: {message: "ya existe"}, presence: {message: "es requerido"}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message:"El formato del correo es invalido"}
end
