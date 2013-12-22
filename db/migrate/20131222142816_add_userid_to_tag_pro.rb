class AddUseridToTagPro < ActiveRecord::Migration
  def change
    add_column :tag_pros, :user_id, :integer
  end
end
