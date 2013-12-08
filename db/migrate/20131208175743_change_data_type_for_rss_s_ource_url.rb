class ChangeDataTypeForRssSOurceUrl < ActiveRecord::Migration
  def change
    change_column :rss_sources, :url, :text
  end
end
