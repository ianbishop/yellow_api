require 'faraday_middleware'

module YellowApi
  class Client
    module Connection
      private

      def connection
        @connection ||= Faraday.new(:url => 'http://api.yellowapi.com/') do |builder|
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::RaiseError
          builder.use Faraday::Response::Rashify
          builder.use Faraday::Response::ParseJson
          builder.adapter(Faraday.default_adapter)
        end
      end
    end
  end
end
