json.array!(@incomes) do |income|
  json.extract! income, :title, :amount, :accounting_date
  json.url income_url(income, format: :json)
end
