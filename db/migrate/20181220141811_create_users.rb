class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :name
      t.integer :project_id
      t.integer :role_id
    end
  end
end
