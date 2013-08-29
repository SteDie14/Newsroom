class AddGuidToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :guid, :string
  end
end
