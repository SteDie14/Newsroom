class CreateRssSources < ActiveRecord::Migration
  def change
    create_table :rss_sources do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
