class CreateTableUserRoles < ActiveRecord::Migration
  def up
    create_table(:user_roles) do |t|
      t.belongs_to  :user
      t.belongs_to  :role
    end
    add_index :user_roles, :user_id
    add_index :user_roles, :role_id
  end

  def down
    drop_table :user_roles
  end
end
