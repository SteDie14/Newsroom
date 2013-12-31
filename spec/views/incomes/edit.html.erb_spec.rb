require 'spec_helper'

describe "incomes/edit" do
  before(:each) do
    @income = assign(:income, stub_model(Income,
      :title => "MyString",
      :amount => "9.99"
    ))
  end

  it "renders the edit income form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", income_path(@income), "post" do
      assert_select "input#income_title[name=?]", "income[title]"
      assert_select "input#income_amount[name=?]", "income[amount]"
    end
  end
end
