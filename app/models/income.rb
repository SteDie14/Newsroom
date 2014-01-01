class Income < Booking
  belongs_to :account
  validates :account, :presence => true
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :amount, :presence => true
  validates :accounting_date, :presence => true
  validates_date :accounting_date
end
