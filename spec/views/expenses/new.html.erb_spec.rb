require 'spec_helper'

describe "expenses/new" do
  before(:each) do
    assign(:expense, stub_model(Expense,
      :title => "MyString",
      :amount => "9.99",
      :tax_rate => 1
    ).as_new_record)
  end

  it "renders new expense form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", expenses_path, "post" do
      assert_select "input#expense_title[name=?]", "expense[title]"
      assert_select "input#expense_amount[name=?]", "expense[amount]"
      assert_select "input#expense_tax_rate[name=?]", "expense[tax_rate]"
    end
  end
end
