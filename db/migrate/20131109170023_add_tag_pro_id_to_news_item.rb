class AddTagProIdToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :tag_pro_id, :integer
  end
end
