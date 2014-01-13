## Generic login ##
Given /^I am about to login$/ do
  welcome = page(WelcomePage).await

  screenshot_embed(:label => 'Login') unless @disable_screenshot

  @page = welcome.mypasslogin

end
## END: generic login ##

## Invalid login ##
When /^I enter invalid credentials$/ do
  @page = @page.login(USERS[:invalid])
  screenshot_embed
end

Then /^I am presented with an error message to correct credentials$/ do
  @page.assert_invalid_login_message
  screenshot_embed
end
## END: Invalid login ##

## Valid login ##
When(/^I enter valid credentials$/) do
  @page = @page.login(USERS[:valid1414])
  screenshot_embed
end

Then(/^I am presented with an main page$/) do
  main_page = page(MainPage)
  @page.equal? main_page
  screenshot_embed
end
## END: Valid login ##


## Login and add blog ##

#noinspection CucumberDuplicatedStep
Given /^I am on the Welcome Screen$/ do
  @page = page(WelcomePage).await

  screenshot_embed
end

When /^I add the WordPress\.com blog$/ do
  @page = @page.wordpress_blog

  @page = @page.login(USERS[:karl])
end

## END: Login ##

def login_from_welcome_screen
  steps '
    Given I am about to login
    When I enter valid credentials
    Then I am presented with an main page
  '
end

Given /^I am logged in$/ do
  unless logged_in?
    login_from_welcome_screen
  end
  @page = page(MainPage).await
end


When /^the menu is visible$/ do
  @page.show_menu
  screenshot_embed(:label => "Menu") unless @disable_screenshot
end