class Expense < ActiveRecord::Base
  belongs_to :account
  validates :account, :presence => true
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :amount, :presence => true
  validates :tax_rate, :presence => true, :inclusion => { :in => 0..99 }
  validates :accounting_date, :presence => true
  validates_date :accounting_date
end
