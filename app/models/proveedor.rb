class Proveedor < ActiveRecord::Base
	self.primary_key = :pro_cod
	has_many :pedidos, :dependent => :destroy, foreign_key: 'pro_cod' 
end
