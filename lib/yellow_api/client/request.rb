require 'uuid'

module YellowApi
  class Client
    module Request
     
      # generates a UUID for a given instance
      # @see https://github.com/assaf/uuid
      def uid
        @uid ||= UUID.new.generate(:compact)
      end

      def get(path, options={})
        # stuff that's sent with every request
        # but define by api initialization
        options[:apikey] = apikey
        options[:fmt] = fmt
        options[:UID] = uid
        
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
