class FoldersNewsItems < ActiveRecord::Migration
  def change
    create_table :folders_news_items do |t|
      t.belongs_to :folder
      t.belongs_to :news_item
    end
  end
end
