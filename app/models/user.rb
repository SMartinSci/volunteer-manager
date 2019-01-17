class User < ApplicationRecord
    has_secure_password
      
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, :confirmation => true

    has_many :roles
    has_many :projects, through: :roles

    def self.find_or_create_by_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password_digest = SecureRandom.hex
        user.name = auth.info.name
        user.save!
    end
  end 
end
