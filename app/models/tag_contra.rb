class TagContra < ActiveRecord::Base
  has_many :news_items, inverse_of: :tag_contra
  belongs_to :user, :inverse_of => :tag_contras

  validates_presence_of :user

  scope :names_with_counts,
        joins("JOIN news_items on news_items.tag_contra_id = tag_contras.id").
            select("tag_contras.name, count(news_items.tag_contra_id) as tag_count").
            group("tag_contras.id").
            order("tag_count DESC")
end
