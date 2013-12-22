class Folder < ActiveRecord::Base
  include Tree
  has_and_belongs_to_many :news_items
  belongs_to :user, :inverse_of => :folders

  validates_presence_of :user
end
