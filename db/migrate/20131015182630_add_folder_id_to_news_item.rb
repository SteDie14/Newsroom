class AddFolderIdToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :folder_id, :integer
  end
end
