class AddSummaryToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :summary, :text
  end
end
