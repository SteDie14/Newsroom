Given(/^I visit the folders overview page\.$/) do
  visit folders_path
end

And /^I see a success notice$/ do
  page.should have_selector ".alert-success"
end


Then(/^I should be on the "(.*?)" path$/) do |arg1|
  current_path.should == folders_path
  # checking path is not sufficient (HTTP method is important too)
  # create (POST request) or index (GET request) action?
  # unfortunately only available with RACK driver:
  if page.driver.respond_to?(:request)
    page.driver.request.request_method.should == 'GET'
  end
end


Then /^I submit the "([^\"]*)" form$/ do |form_id|
  element = find_by_id(form_id)
  Capybara::RackTest::Form.new(page.driver, element.native).submit :name => nil
end


Given(/^I Select "(.*?)" from "(.*?)"$/) do |arg1, arg2|
  select(arg1, :from => arg2)
end


And /^I fill in "([^"]*)" with "([^"]*)"$/ do |name, value|
  fill_in(name, :with => value)
end




