class User < ApplicationRecord
    has_secure_password
      
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, :confirmation => true

    has_many :roles
    has_many :projects, through: :roles
end
