require 'feedzirra'
class RssSource < ActiveRecord::Base
  has_many :news_items, :inverse_of => :rss_source, :dependent => :destroy
  belongs_to :user, :inverse_of => :rss_sources

  validates_presence_of :user

  #@TODO: Add Custom Validations for FEED-Urls
  #def valid?(url)
  #  uri = URI.parse(url)
  #  uri.kind_of?(URI::HTTP)
  #rescue URI::InvalidURIError
  #  false
  #end

  def update_from_feed(owner)
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    unless 0==feed || feed.nil?

      feed.entries.each do |entry|
        if feed.entries == 500
          next
        end
        guid = entry.id
        news_item = self.news_items.where(:guid => guid).first
        if news_item.nil?
          self.news_items.create!(
            :headline => entry.title,
            :summary => entry.summary,
            :web_url => entry.url,
            :release_date => entry.published,
            :guid => entry.id,
            :user => owner
            #:rss_source_id => self.id
          )
        end
      end
    end
  end
end