require 'spec_helper'

describe "incomes/index" do
  before(:each) do
    assign(:incomes, [
      stub_model(Income,
        :title => "Title",
        :amount => "9.99"
      ),
      stub_model(Income,
        :title => "Title",
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of incomes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
