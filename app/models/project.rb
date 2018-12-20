class Project < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :users 
    has_many :tasks 
end
