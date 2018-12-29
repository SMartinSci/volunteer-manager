class Project < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :time, presence: true
    validates :location, presence: true
    validates :time, presence: true
    validates :description, presence: true

    has_many :roles
    has_many :users, through: :roles
    has_many :tasks
    has_many :tasks, through: :roles
end
