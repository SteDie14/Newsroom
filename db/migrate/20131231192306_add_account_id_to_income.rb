class AddAccountIdToIncome < ActiveRecord::Migration
  def change
    add_column :incomes, :account_id, :integer
  end
end
