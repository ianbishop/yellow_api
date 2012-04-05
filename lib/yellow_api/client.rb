require 'yellow_api/client/connection'
require 'yellow_api/client/request'
require 'yellow_api/client/find_business'

module YellowApi
  class Client
    include YellowApi::Client::Connection
    include YellowApi::Client::Request

    include YellowApi::Client::FindBusiness
  end
end
