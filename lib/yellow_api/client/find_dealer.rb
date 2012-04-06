module YellowApi
  class Client
    module FindDealer

      # Returns a list of all dealers/franchises/branches for that business. 
      #
      # @see http://www.yellowapi.com/docs/places/#finddealer
      # @note A business with several locations may have a "parent" listing (primary) and one or more "children" listings.
      # @rate_limited Yes
      # @requires_authentication Yes
      # @param parent_id [Integer] The listingId of a parent business. 
      #   A parent business can be identified by the ‘isParent’ flag in the Listing object returned by FindBusinesses.
      # @param options [Hash] A customizable set of options
      # @option options [Integer] :pg The requested page. Default 1. Max 50.
      # @option options [String] :lang en - English (default), fr - French
      # @option options [Integer] :pgLen Number of results per page. Default 40. Max 100.
      # @return {Hash}
      # @example
      #   YellowApi.find_dealer(6418182)
      #   YellowApi.find_dealer(6418182, { :pgLen => 1 })
      def find_dealer(parent_id, options={})
        options[:pid] = parent_id
        
        get('/FindDealer/', options)
      end

    end
  end
end
