class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.decimal :amount
      t.integer :tax_rate
      t.date :accounting_date

      t.timestamps
    end
  end
end
