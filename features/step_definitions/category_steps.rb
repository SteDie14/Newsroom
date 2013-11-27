Then(/^I see the newest Category$/) do
  page.should have_content Folder.all.last.title
end


Given(/^I visit the new category page$/) do
  visit new_folder_path
end

And /^I Select "(.*?)" from "(.*?)"\.$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end