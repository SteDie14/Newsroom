class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rss_sources, :inverse_of => :user, :dependent => :destroy
  has_many :folders, :inverse_of => :user, :dependent => :destroy
  has_many :news_items, :inverse_of => :user, :dependent => :destroy
end
