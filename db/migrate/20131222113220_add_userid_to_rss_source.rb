class AddUseridToRssSource < ActiveRecord::Migration
  def change
    add_column :rss_sources, :user_id, :integer
  end
end
