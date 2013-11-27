class TagPro < ActiveRecord::Base
  has_many :news_items, inverse_of: :tag_pro
  scope :names_with_counts,
        joins("JOIN news_items on news_items.tag_pro_id = tag_pros.id").
            select("tag_pros.name, count(news_items.tag_pro_id) as tag_count").
            group("tag_pros.id").
            order("tag_count DESC")
end
