class AddUseridToFolder < ActiveRecord::Migration
  def change
    add_column :folders, :user_id, :integer
  end
end
