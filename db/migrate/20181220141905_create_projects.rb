class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.text :description
      t.datetime :date
      t.integer :role_id
      t.integer :user_id
      t.datetime :time
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
