class ChangeTextFormatInNewsItems < ActiveRecord::Migration
  def change
    change_column :news_items, :guid,  :text
  end
end
