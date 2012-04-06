require 'faraday_middleware'

module YellowApi
  class Client
    module Connection
      private

      def connection(options={})
        sandbox_enable = options.fetch(:sandbox_enabled, sandbox_enabled)
        url = sandbox_enable ? options.fetch(:sandbox_endpoint, sandbox_endpoint) : options.fetch(:endpoint, endpoint)

        @connection ||= Faraday.new(:url => url) do |builder|
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
