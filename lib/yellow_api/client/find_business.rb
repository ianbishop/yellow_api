module YellowApi
  class Client
    module FindBusiness

      # Returns a listing of businesses matching specified criteria
      # 
      # @see http://www.yellowapi.com/docs/places/#findbusiness
      # @note Max 5000 results returned
      # @rate_limited Yes
      # @requires_authentication Yes
      # @param what [String] Keyword search term. Any text string. 
      #   For example "restaurant". Non-ASCII characters should be escaped
      # @param where [String] The location to search. May be a location name or coordinate in format cZ{longitude},{latitude}.
      # @param options [Hash] A customizable set of options
      # @option options [Integer] :pg The requested page. Default 1. Max 50.
      # @option options [String] :lang en - English (default), fr - French
      # @option options [Integer] :pgLen Number of results per page. Default 40. Max 100.
      # @option options [String] :sflag Search flags. 
      #   bn - {what} is a business name, fto - results have photos, vdo - results have videos
      # @return {Hash}
      # @example 
      #   YellowApi.find_business("restaurant", "Toronto")
      #   YellowApi.find_business("h%C3%B4tels", "cZ-73.61995,45.49981")
      def find_business(what, where, options={})
        options[:what] = what
        options[:where] = where
        
        get('/FindBusiness/', options)
      end
    end
  end
end
