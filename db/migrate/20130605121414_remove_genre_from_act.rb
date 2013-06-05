class RemoveGenreFromAct < ActiveRecord::Migration
  def up
    remove_column :acts, :genre_id
  end

  def down
    add_column :acts, :genre_id, :string
  end
end
