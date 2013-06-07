class AddShortToAct < ActiveRecord::Migration
  def change
    add_column :acts, :short_bio, :string
  end
end
