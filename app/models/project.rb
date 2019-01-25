class Project < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :time, presence: true
    validates :location, presence: true
    validates :time, presence: true
    validates :description, presence: true
    
    belongs_to :user
    has_many :roles
    has_many :users, through: :roles
    has_many :tasks
    has_many :tasks, through: :roles

    scope :this_year, -> { where(:date=> Time.now.beginning_of_year..Time.now.end_of_year) }

    def self.next_project
        order('created_at desc').first
    end

end
