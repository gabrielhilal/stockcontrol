Given(/^I exist as a user$/) do
  @user = FactoryGirl.create(:user)
end
When(/^I go to the login page$/) do
  visit login_path
end
When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end
When(/^I press "([^"]*)"$/) do |button|
  click_on(button)
end
When(/^I should see "([^"]*)"$/) do |arg|
  page.should have_content(arg)
end
When(/^I should be redirected to the home page$/) do
  visit home_path
end
When(/^I should see the login page again$/) do
  visit login_path
end