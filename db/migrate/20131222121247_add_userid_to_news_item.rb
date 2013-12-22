class AddUseridToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :user_id, :integer
  end
end
