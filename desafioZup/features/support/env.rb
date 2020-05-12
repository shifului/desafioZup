require "capybara/cucumber"
require "selenium-webdriver"
require "byebug"
require_relative "helper.rb"
require_relative "page_helper.rb"

World(Pages)
World(Helper)

ENV["chrome"]
Capybara.default_driver = :chrome
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: Selenium::WebDriver::Chrome::Options.new(args: %w(--start-maximized --incognito)))
end
