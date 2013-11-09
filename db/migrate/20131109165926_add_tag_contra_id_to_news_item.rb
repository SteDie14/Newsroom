class AddTagContraIdToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :tag_contra_id, :integer
  end
end
