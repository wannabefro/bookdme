class AddStuffToAct < ActiveRecord::Migration
  def change
    add_column :acts, :slug, :string
    add_index :acts, :slug, unique: true
  end
end
