# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the list of categories$/
	categories_path
    when /^the show category$/
	category_path(@category)
    when /^the edit category page$/
	edit_category_path(@category)
	when /^the list of tickets$/
	tickets_path
    when /^the show ticket$/
	ticket_path(@ticket)
    when /^the edit ticket page$/
	edit_ticket_path(@ticket)
    when /^the list of emails$/
	emails_path
    when /^the show email$/
	email_path(@email)
    when /^the edit email page$/
	edit_email_path(@email)
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
