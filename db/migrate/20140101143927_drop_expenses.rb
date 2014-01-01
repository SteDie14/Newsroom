class DropExpenses < ActiveRecord::Migration
  def change
    drop_table :expenses
  end
end
