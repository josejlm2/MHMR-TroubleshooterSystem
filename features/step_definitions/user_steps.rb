Given /^I am a current user$/ do
  User.create!(email: "name@name.com", password: "password1")
end

Given /^I am not a current user$/ do
end
