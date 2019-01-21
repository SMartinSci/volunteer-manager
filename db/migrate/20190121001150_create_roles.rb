class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer  :user_id
      t.integer  :project_id
      t.string   :name
    end
  end
end
