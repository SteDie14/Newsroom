class DropIncomes < ActiveRecord::Migration
  def change
    drop_table :incomes
  end
end
