class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :title
      t.decimal :amount
      t.date :accounting_date

      t.timestamps
    end
  end
end
