class NewsItem < ActiveRecord::Base
  belongs_to :rss_source, :inverse_of => :news_items
  has_and_belongs_to_many :folders
  belongs_to :tag_pro, :inverse_of => :news_items
  belongs_to :tag_contra, :inverse_of => :news_items
  belongs_to :user, :inverse_of => :news_items

  validates_presence_of :user

  def update (params)
    folder_ids = [params[:folder_ids][:first], params[:folder_ids][:second], params[:folder_ids][:third]].uniq
    self.folder_ids = folder_ids
    self.user = current_user
    self.save
  end

end
