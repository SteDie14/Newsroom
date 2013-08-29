class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.date :release_date
      t.string :vendor
      t.string :headline
      t.string :topic
      t.string :keywords
      t.string :web_url
      t.string :doc_url
      t.text :comment
      t.integer :rss_source_id, index: true
      t.timestamps
    end
  end
end
