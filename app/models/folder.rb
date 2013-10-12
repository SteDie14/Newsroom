class Folder < ActiveRecord::Base

  has_many :news_items, inverse_of: :folder

end
