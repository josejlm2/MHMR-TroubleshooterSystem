Given /^I am a current user$/ do
  User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: false, manager: false)
end

Given /^I am an admin user$/ do
  User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
end

Given /^I am not a current user$/ do
end
