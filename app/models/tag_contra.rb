class TagContra < ActiveRecord::Base
  has_many :news_items, inverse_of: :tag_contra
end
