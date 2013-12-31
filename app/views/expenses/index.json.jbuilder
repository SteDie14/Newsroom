json.array!(@expenses) do |expense|
  json.extract! expense, :title, :amount, :tax_rate, :accounting_date
  json.url expense_url(expense, format: :json)
end
