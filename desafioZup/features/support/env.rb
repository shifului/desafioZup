require "capybara/cucumber"
require "selenium-webdriver"
require "byebug"


EL = YAML.load_file('data/elements.yml')

case ENV['BROWSER']
  when 'cc', 'chrome'
  Capybara.javascript_driver = :selenium
  Capybara.default_driver = :selenium
  Capybara.register_driver(:selenium) do |app|
    options = Selenium::WebDriver::Chrome::Options.new(
      args: %w[--incognito 
               --disable-gpu 
               --no-sandbox 
               --disable-web-security 
               --window-size=1366,768
              ]
    )
    read_timeout = 400
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      acceptInsecureCerts: true,
    )
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options,
      desired_capabilities: capabilities
    )
end
when 'hh', 'headless'
  Capybara.javascript_driver = :selenium_chrome_headless
  Capybara.default_driver = :selenium_chrome_headless
  Capybara.register_driver(:selenium_chrome_headless) do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: %w[--headless 
             --incognito 
             --disable-gpu 
             --no-sandbox 
             --disable-setuid-sandbox 
             --disable-web-security 
             --window-size=1366,768
             --start-maximized
             --disable-infobars
            ]
  )
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 240
  # read_timeout = 800
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    acceptInsecureCerts: true,
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options,
    http_client: client,
    desired_capabilities: capabilities
  )
  end
end
