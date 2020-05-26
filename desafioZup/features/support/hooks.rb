require 'report_builder'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'rspec/retry'

ReportBuilder.configure do |config|
  config.json_path = 'output/reports/report.json'
  config.report_path = 'output/reports/report'
  config.report_types = [:html, :retry]
  config.report_title = 'Report Test Americanas'
  config.include_images = true
  config.color = 'cyan'
end

RSpec.configure do |config|
  config.verbose_retry = true
  config.default_retry_count = 2
  config.exceptions_to_retry = [Net::ReadTimeout]
end

Before do
  @prod = []
  @busca = Busca.new
  @acessarProduto = AcessarProduto.new
  @adicionar_produto = AdicionarProduto.new
  @remover_produto = RemoverProduto.new
  include RSpec::Matchers
  Capybara.reset_sessions!
  page.driver.browser.manage.window.resize_to(1366, 768)
  page.driver.browser.manage.window.maximize
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('output', 0777) if not File.directory?('output')
    Dir::mkdir('output/screenshots', 0777) if not File.directory?('output/screenshots')
    screenshot = "./output/screenshots/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    if page.driver.browser.respond_to?(:save_screenshot) then
      page.driver.browser.save_screenshot(screenshot)
      else
        save_screenshot(screenshot)
    end
      FileUtils.chmod(0777, screenshot)
      embed(current_url, 'text/plain', current_url)
      embed(screenshot, 'image/png', ' Screenshot')
    end 
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    Capybara.current_session.driver.quit  
end

at_exit do
  ReportBuilder.build_report
end
