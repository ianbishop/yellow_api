require 'active_support/all'

module YellowApi
  class Client
    module GetBusinessDetails

      PROVINCE_ABBREVIATION_MAP = {
        :ab => "Alberta",
        :bc => "British-Columbia",
        :mb => "Manitoba",
        :nb => "New-Brunswick",
        :nl => "Newfoundland-and-Labrador",
        :nt => "Northwest-Territories",
        :ns => "Nova-Scotia",
        :nu => "Nunavut",
        :on => "Ontario",
        :pe => "Prince-Edward-Island",
        :qc => "Quebec",
        :sk => "Saskatchewan",
        :yt => "Yukon"
      }

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
        options[:prov] = normalize(expand_province(province))
        options["bus-name"] = normalize(business_name)
        options[:listingId] = listing_id
        options[:city] = normalize(options[:city]) if options.has_key? :city

        get('/GetBusinessDetails/', options)
      end

      # Normalizes a given string
      #
      # All accents are removed (i.e. ‘à’ becomes ‘a’), 
      # and All non-alphanumeric characters are replaced by dash “-”, and
      # Multiple dashes are replaced by a single dash.
      #
      # @see http://www.yellowapi.com/docs/places/#getbusinessdetails
      # @see http://stackoverflow.com/questions/225471/how-do-i-replace-accented-latin-characters-in-ruby
      def normalize(s)
        s.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s
          .gsub(/[\W]/, '-').gsub(/-+/, '-')
      end

      # Expands an abbreviated province
      #
      # This handles the fact that FindBusiness returns abbreviated provinces codes
      # yet expects full province names for GetBusinessDetails
      def expand_province(prov)
        PROVINCE_ABBREVIATION_MAP.fetch(prov.downcase.to_sym, prov)
      end
    end
  end
end
