require 'spec_helper'

describe "incomes/new" do
  before(:each) do
    assign(:income, stub_model(Income,
      :title => "MyString",
      :amount => "9.99"
    ).as_new_record)
  end

  it "renders new income form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", incomes_path, "post" do
      assert_select "input#income_title[name=?]", "income[title]"
      assert_select "input#income_amount[name=?]", "income[amount]"
    end
  end
end
