class TagPro < ActiveRecord::Base
  has_many :news_items, inverse_of: :tag_pro
end
