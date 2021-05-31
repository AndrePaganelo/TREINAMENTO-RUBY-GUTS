require 'rspec'
require 'capybara/cucumber'
require 'site_prism'
require 'cucumber'
require 'faker'

Capybara.register_driver :site_prism do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, :driver_path => 'c:\ChromeDriver\chromedriver.exe', :desired_capabilities => :chrome)
end


Capybara.configure do |config|
    config.run_server = false 
    Capybara.default_driver = :site_prism
    Capybara.page.driver.browser.manage.window.maximize
    config.default_max_wait_time = 10 
    config.app_host = 'http://www.automationpractice.com/index.php'
end