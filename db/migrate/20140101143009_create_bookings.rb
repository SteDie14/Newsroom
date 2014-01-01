class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :title
      t.decimal :amount
      t.date :accounting_date
      t.integer :account_id
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
