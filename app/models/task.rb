class Task < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :projects
end
