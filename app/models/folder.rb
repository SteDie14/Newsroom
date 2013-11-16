class Folder < ActiveRecord::Base
  include Tree
  has_and_belongs_to_many :news_items
end
