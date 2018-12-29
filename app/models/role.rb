class Role < ApplicationRecord
    belongs_to :user
    belongs_to :project
    has_many :tasks

    validates_presence_of :name
end
