class RemoveFolderIdFromNewsItems < ActiveRecord::Migration
  def change
    remove_column :news_items, :folder_id, :integer
  end
end
