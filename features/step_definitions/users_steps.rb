def create_user(user)
  @user = FactoryGirl.create(user)
end

Given(/^I exist as a "([^"]*)"$/) do |user|
  create_user(user)
end

Given(/^I'm in the "([^"]*)" page$/) do |link|
  visit "/#{link}"
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I press "([^"]*)"$/) do |button|
  click_on(button)
end

Then(/^I should see "([^"]*)"$/) do |arg|
  page.should have_content(arg)
end

Then(/^I should be redirected to the "([^"]*)" page$/) do |link|
  visit "/#{link}"
end


Given(/^I am logged in as the "([^"]*)"$/) do |user|
  create_user(user)
  visit '/login'
  fill_in 'Username', with: user
  fill_in 'Password', with: 'secret'
  click_button 'Login'
  page.should have_content("Welcome #{user}")
end

And(/^the users with roles (.+) exist$/) do |usernames|
  usernames.split(', ').each do |username|
  create_user(username)
  end
end

When(/^I go to the "([^"]*)" page$/) do |page|
  visit "/#{page}"
end

When(/^I select "([^"]*)" from the list$/) do |selection|
  page.should have_content(selection)
  page.select(selection)
end

When(/^I am creating a new user without a username$/) do
  step %{I go to the "users/new" page}
  page.select 'director', from: 'user_role'
  step %{I fill in "Password" with "secret"}
  step %{I fill in "Password confirmation" with "secret"}
end

When(/^I am creating a new user without a role$/) do
  step %{I go to the "users/new" page}
  step %{I fill in "Username" with "newuser"}
  step %{I fill in "Password" with "secret"}
  step %{I fill in "Password confirmation" with "secret"}
end
When(/^I see the user "([^"]*)" with the "([^"]*)" role$/) do |user, role|
  newuser = create_user(user)
  newuser.role.should == role
  step %{I go to the "users" page}
  page.should have_content(user)
  page.should have_content(user)
end

When(/^I change the role to "([^"]*)"$/) do |newrole|
  page.select newrole, from: 'Role'
  step %{I press "Update User"}
end
