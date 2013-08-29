class RssSource < ActiveRecord::Base
  def update_from_feed
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    feed.entries.each do |entry|
      guid = entry.id
      news_item = NewsItem.where(:RssSource_id => self.id).where(:guid => guid).first
      if news_item.nil?
        NewsItem.create!(
          :headline => entry.title,
          :summary => entry.summary,
          :web_url => entry.url,
          :release_date => entry.published,
          :guid => entry.id
        )
      end
    end
  end
end
