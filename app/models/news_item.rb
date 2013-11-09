class NewsItem < ActiveRecord::Base
  belongs_to :rss_source, :inverse_of => :news_items
  belongs_to :folder, :inverse_of => :news_items
  belongs_to :tag_pro, :inverse_of => :news_items
  belongs_to :tag_contra, :inverse_of => :news_items

  #def update (params)
  #  puts "test"
  #end
end
