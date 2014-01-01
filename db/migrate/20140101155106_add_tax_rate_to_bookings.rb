class AddTaxRateToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :tax_rate, :integer
  end
end
