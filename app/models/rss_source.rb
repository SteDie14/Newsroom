require 'feedzirra'
class RssSource < ActiveRecord::Base
  has_many :news_items, :inverse_of => :rss_source

  def update_from_feed
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    unless 0==feed
      feed.entries.each do |entry|
        guid = entry.id
        news_item = self.news_items.where(:guid => guid).first
        if news_item.nil?
          self.news_items.create!(
            :headline => entry.title,
            :summary => entry.summary,
            :web_url => entry.url,
            :release_date => entry.published,
            :guid => entry.id,
            #:rss_source_id => self.id
          )
        end
      end
    end
  end

  #@TODO: .gsub(/feed:\/\//,'http://')
end
