module YellowApi
  class Client
    module GetBusinessDetails

      # Gets business details.
      # 
      # @see http://www.yellowapi.com/docs/places/#getbusinessdetails
      # @note Requires a FindBusiness call first. 
      # Information returned on this first call provides the necessary information for the GetBusinessDetails call.
      # @rate_limited Yes
      # @requires_authentication Yes
      # @param province [String] Normalized formatted name of province where the business is located. 
      # If not available, use "Canada"
      # @param business_name [String] Business name
      # @param listing_id [Integer] The unique listing id identifying the business
      # @param options [Hash] A customizable set of options
      # @option options [String] :city The city location of the business
      # @option options [String] :lang en - English (default), fr - French
      # @return {Hash}
      # @example
      #   YellowApi.get_business_details("Ile-du-Prince-Edouard", "Co-operators-The", 6418182)
      def get_business_details(province, business_name, listing_id, options={})
        options[:prov] = province
        options["bus-name"] = business_name
        options[:listingId] = listing_id

        get('/GetBusinessDetails/', options)
      end

    end
  end
end
