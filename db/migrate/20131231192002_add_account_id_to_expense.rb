class AddAccountIdToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :account_id, :integer
  end
end
