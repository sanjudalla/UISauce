require "capybara/cucumber"
require "selenium/webdriver"
require 'sauce_whisk'

Capybara.default_driver=:selenium


=begin
Capybara.default_driver=:selenium
Capybara.default_max_wait_time=30
Capybara.app_host='https://dev-web.core.merrillcorp.com/'

Capybara.register_driver :selenium do |app|                                                                                                                                      
    Capybara::Selenium::Driver.new(app, browser: :firefox)
end 
=end


ENV['env'] ||= 'dev'
ENV['run'] ||= 'sauce'
ENV['browser'] ||= 'firefox'
ENV['SAUCE_USERNAME'] = 'sdalla'
ENV['SAUCE_ACCESS_KEY'] = 'ce6c09ae-761b-4612-bf48-8a8df536f466' 
  
  
if ENV['env']=='dev'
  Capybara.app_host='https://dev-web.core.merrillcorp.com/'
elsif ENV['env'] == 'stage'
    Capybara.app_host='https://stage-web.core.merrillcorp.com/'
elsif ENV['env'] == 'prod'
    Capybara.app_host='https://datasiteone.merrillcorp.com/'
end
  


if ENV['run']=='sauce'
  Capybara.default_max_wait_time = 10
  Capybara.current_driver = :selenium


  url="http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub".strip
  
  
  Around do |scenario, block|
     block.call
     sessionid = ::Capybara.current_session.driver.browser.session_id
     ::Capybara.current_session.driver.quit
 
     # sessionid = Capybara.current_session.driver.browser.session_id
     jobname = "#{scenario.feature.name} - #{scenario.name}"
     # Output sessionId and jobname to std out for Sauce OnDemand Plugin to display embeded results
     puts "SauceOnDemandSessionID=#{sessionid} job-name=#{jobname}"
     job = SauceWhisk::Jobs.fetch sessionid
     job.name = 'Env: ' + ENV['env'] + ' => '+ jobname
     job.save
 
   end
   
  After do |scenario|
     # Do something after each scenario.
     # The +scenario+ argument is optional, but
     # if you use it, you can inspect status with
     # the #failed?, #passed? and #exception methods.
     sessionid = ::Capybara.current_session.driver.browser.session_id
     job = SauceWhisk::Jobs.fetch sessionid
     if scenario.failed?
       job.passed = scenario.passed? ? true : false
       job.save
     elsif scenario.passed?
       job.passed = scenario.passed? ? true : false
       job.save
     end
 
   end
   
  
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
=begin

    
  if ENV['run'] == 'local'
  
    if ENV['browser'] == 'chrome'
      Capybara.default_driver = :chrome

      Capybara.register_driver :chrome do |app|
        options = {
            :js_errors => false,
            :timeout => 360,
            :debug => false,
            :inspector => false,
        }
        caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--start-maximized" ]})
        Capybara::Selenium::Driver.new(app,:browser => :chrome, :desired_capabilities => caps)
      end
      
  end
  

  
  
   
end
    
=end