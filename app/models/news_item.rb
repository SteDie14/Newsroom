class NewsItem < ActiveRecord::Base
  belongs_to :rss_source, :inverse_of => :news_items
  has_and_belongs_to_many :folders
  belongs_to :tag_pro, :inverse_of => :news_items
  belongs_to :tag_contra, :inverse_of => :news_items

  def update (params)
    folder_ids = [params[:folder_ids][:first], params[:folder_ids][:second], params[:folder_ids][:third]].uniq
    self.folder_ids = folder_ids
    self.save
  end
end
