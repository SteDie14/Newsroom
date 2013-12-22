class AddUseridToTagContra < ActiveRecord::Migration
  def change
    add_column :tag_contras, :user_id, :integer
  end
end
