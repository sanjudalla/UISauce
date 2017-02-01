After('~@login') do |scenario|
  step "I log out"
end

Before('~@login') do |scenario|
  step "I open the app"
  step "I should be on the login page"

  sleep(rand(1..10))
  index = rand(1..10)
  if ENV['env'] == 'dev'
    $username = "devenvuser#{index}@mailinator.com"
  elsif ENV['env'] == 'stage'
    $username = "stageuser#{index}@mailinator.com"
  elsif ENV['env'] == 'prod'
    $username = "produser#{index}@mailinator.com"
  end
  step "I enter username #{$username} and password Password@1"
  step "the project navigation bar should be present"
end