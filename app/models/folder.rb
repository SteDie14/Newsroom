class Folder < ActiveRecord::Base
  include Tree

  has_many :news_items, inverse_of: :folder
end
