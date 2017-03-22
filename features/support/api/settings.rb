require 'rubygems'
require 'mime/types'
require 'rest_client'

module Settings
  
    @@port=''
    @@host=''
    @@tokenHost = ''
    
  if ENV['env'] == 'dev'
  
      @@host = "javelin-api-gateway.apps.foundry.mrll.com"
      @@port = "80"
      #@@token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1ZTc2YjEwMi03MzM3LTQ2MjMtOGQ5Ny02MDUyZTllZmMyOWEiLCJncm91cCI6ImNsaWVudCIsImV4cCI6MTUwNTQxNDQxNTY5Nywic2NvcGUiOltdLCJpc3MiOiJpYW0ubWVycmlsbGNvcnAuY29tIiwiYXVkIjoiamF2ZWxpbm1jLmNvbSIsIlVzZXJOYW1lIjoiZGV2amF2YWRhbTFAZ21haWwuY29tIn0.8_f4qt-HlFHT0tlV19X5m3Ixv2aXCKbO95RZEIH-fWc"
      @@tokenHost = "http://token-service.apps.foundry.mrll.com/api/tokens/user/gatewayJwt"
      
  end
    
    
end