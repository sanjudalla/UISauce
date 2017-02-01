When(/^I enter username ([^"]*) and password ([^"]*)$/) do |username, password|
  fill_in 'username', :with => username
  fill_in 'password', :with => password
  click_button 'LOG IN'
end

Given(/^I open the app$/) do
  visit '/'
  sleep(1)
end

Then(/^I should be on the login page$/) do
  expect(page).to have_content('LOG IN')
end


Then(/^the project navigation bar should be present$/) do
  #sleep(10)
  expect(page).to have_xpath("//span[contains(text(), 'DOCUMENTS')]", wait: 40)
  step "User clicks on Documents tab"

end

Then(/^User clicks on Documents tab$/) do
  find(:xpath, "//span[contains(text(), 'DOCUMENTS')]", match: :first).click
  expect(page).to have_selector(config['documents_obj']['navBar'], wait: 30)
end
