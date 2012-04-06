require 'yellow_api/config'
require 'yellow_api/client/connection'
require 'yellow_api/client/request'
require 'yellow_api/client/find_business'
require 'yellow_api/client/get_business_details'
require 'yellow_api/client/find_dealer'

module YellowApi
  class Client
    include YellowApi::Client::Connection
    include YellowApi::Client::Request

    include YellowApi::Client::FindBusiness
    include YellowApi::Client::GetBusinessDetails
    include YellowApi::Client::FindDealer

    attr_accessor *Config::VALID_OPTIONS_KEYS

    # Initializes a new API object
    #
    # @param attrs [Hash]
    # @return [YellowApi::Client]
    def initialize(attrs={})
      YellowApi.reset #TODO: this shouldn't be required since I'm extending config?
      attrs = YellowApi.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |k|
        instance_variable_set("@#{k}".to_sym, attrs[k])
      end
    end
  end
end
