class ChangeDataTypeForNewsItemWebUrl < ActiveRecord::Migration
  def change
    change_column :news_items, :web_url, :text
  end
end
