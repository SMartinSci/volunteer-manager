class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :role_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :description
    end
  end
end
