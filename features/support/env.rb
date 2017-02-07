require "capybara/cucumber"
require "selenium/webdriver"

ENV['TEST_ENV'] ||= 'dev'
ENV['TEST_Run'] ||= 'sauce'
ENV['TEST_Browser'] ||= 'chrome'
ENV['SAUCE_USERNAME'] = 'sauceinmerrill'
ENV['SAUCE_ACCESS_KEY'] = 'ace7b619-cddd-484c-a535-8fad4de50a84' 
  
  
if ENV['TEST_ENV']=='dev'
  Capybara.app_host='https://dev-web.core.merrillcorp.com/'
elsif ENV['TEST_ENV'] == 'stage'
    Capybara.app_host='https://stage-web.core.merrillcorp.com/'
elsif ENV['TEST_ENV'] == 'prod'
    Capybara.app_host='https://datasiteone.merrillcorp.com/'
end
  

if ENV['TEST_Run']=='sauce'
  Capybara.default_max_wait_time = 10
  Capybara.current_driver = :selenium


  url="http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub".strip
  
  Before do | scenario |
  if ENV['browser'] == 'chrome'
   
    
        Capybara.register_driver :selenium do |app|
          
          capabilities = {
              :version => '49',
              :browserName => ENV['browser'],
              :platform => 'Windows 7'
  
          }
          Capybara::Selenium::Driver.new(app,
                                         :browser => :remote,
                                         :url     => url,
                                         :desired_capabilities => capabilities
  
          )
   end
  end
    if ENV['browser'] == 'firefox'
      
      Capybara.register_driver :selenium do |app|
        profile = Selenium::WebDriver::Firefox::Profile.new
        profile['browser.helperApps.neverAsk.saveToDisk'] = "text/csv,application/pdf,application/doc,application/docx,image/jpeg"
                profile['browser.download.manager.showWhenStarting'] = false
                profile['browser.download.folderList'] = 2
        capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(:version => '49',
                                                                                 :browserName => ENV['browser'],
                                                                                 :platform => 'Windows 7',
                                                                                 :firefox_profile => profile
                )
                Capybara::Selenium::Driver.new(app,
                                               :browser => :remote,
                                               :url => url,
                                               :desired_capabilities => capabilities
                                               )
              end
      end
    end

      
  end
   

