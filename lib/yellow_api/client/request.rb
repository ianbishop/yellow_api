module YellowApi
  class Client
    module Request
      def get(path, options={})
        request(:get, path, options)
      end

      def request(method, path, options)
        response = connection.send(method) do |request|
          request.url(path, options)
        end

        response.body
      end
    end
  end
end
