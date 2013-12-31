class Account < ActiveRecord::Base
  has_many :expenses, :inverse_of => :account
  has_many :incomes, :inverse_of => :account
end
