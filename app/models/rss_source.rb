class RssSource < ActiveRecord::Base
  def self.update_from_feed
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    feed.entries.each do |entry|
      guid = entry.id
      news_item = NewsItem.where(:RssSource_id => self.id).where(:guid => guid)
      unless news_item
        NewsItem.create!(
          :headline => entry.title,
          :summary => entry.summary,
          :web_url => entry.url,
          :release_date => entry.published,
          :guid => entry.guid
        )
      end
    end
  end
end
