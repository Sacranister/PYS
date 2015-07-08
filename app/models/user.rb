class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_validation(:on => :create) do
    default_values
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin cliente vendedor]
  
  def role_symbols
    [role.to_sym]
  end
def default_values
	self.role='cliente'
end
end
