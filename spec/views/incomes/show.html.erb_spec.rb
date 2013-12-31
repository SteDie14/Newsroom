require 'spec_helper'

describe "incomes/show" do
  before(:each) do
    @income = assign(:income, stub_model(Income,
      :title => "Title",
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/9.99/)
  end
end
