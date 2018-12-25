class Task < ApplicationRecord
    validates :description, presence: true
    belongs_to :role
end
