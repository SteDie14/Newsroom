class Booking < ActiveRecord::Base
  belongs_to :account
  validates :tax_rate, :presence => true, :inclusion => { :in => 0..99 }
end
