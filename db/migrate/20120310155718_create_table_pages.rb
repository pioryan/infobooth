class CreateTablePages < ActiveRecord::Migration
  def up
    create_table(:pages) do |t|
      t.string  :title, :null => false
      t.string  :slug,  :null => false
      t.text    :body
      t.boolean :active, :default => false
      t.integer :created_by, :null => false
      t.integer :modified_by, :null => false
    end

    add_index :pages, :title, :unique => true
    add_index :pages, :slug, :unique => true

  end

  def down
    drop_table :pages
  end
end
