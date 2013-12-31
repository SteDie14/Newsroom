class Account < ActiveRecord::Base
  has_many :expenses, :inverse_of => :account
  has_many :incomes, :inverse_of => :account

  validates_presence_of :user_id
  validates_presence_of :name
end
