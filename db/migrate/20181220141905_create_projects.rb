class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.text :description
      t.datetime :date
      t.datetime :time
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :user_id
    end
  end
end
