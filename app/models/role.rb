class Role < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates_presence_of :name
end
