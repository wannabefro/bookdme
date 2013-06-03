class AddIdToContactInfo < ActiveRecord::Migration
  def change
    add_column :contact_infos, :user_id, :integer
  end
end
