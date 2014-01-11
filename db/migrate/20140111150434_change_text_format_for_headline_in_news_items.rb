class ChangeTextFormatForHeadlineInNewsItems < ActiveRecord::Migration
  def change
    change_column :news_items, :headline,  :text
    change_column :news_items, :vendor,  :text
    change_column :news_items, :topic,  :text
    change_column :news_items, :keywords,  :text
    change_column :news_items, :doc_url, :text
  end
end
