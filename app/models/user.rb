class User < ApplicationRecord
    has_secure_password
      
    validates :email, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, :confirmation => true

    has_many: tasks
    has_many: projects
end
