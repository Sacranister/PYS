class Proveedor < ActiveRecord::Base
	has_many :pedidos
end
