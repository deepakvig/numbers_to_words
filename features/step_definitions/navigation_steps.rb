Given /^I am on the home page$/ do
  visit root_path
end

Given /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  fill_in(arg1.gsub(' ', '_'), :with => arg2)
end

Given /^I select "(.*?)" in "(.*?)"$/ do |arg1, arg2|
  select(arg1, :from => arg2)
end

When /^I press "(.*?)"$/ do |arg1|
  click_button(arg1)
end

Then(/^page should have notice message "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end