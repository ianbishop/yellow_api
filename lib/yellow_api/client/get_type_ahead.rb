module YellowApi
  class Client
    module GetTypeAhead

      # The type ahead call returns search suggestions based on the characters a user has entered.
      # The user can select the suggested term, saving them from having to enter all the characters for their search term.
      #
      # @see http://www.yellowapi.com/docs/places/#gettypeahead
      # @rate_limited Yes
      # @reqires_authentication Yes
      #
      # @param text [String] Characters typed by user
      # @param lang [String] Suggestion languages (en - English, fr - French)
      # @param field [String] Which field to suggest, WHAT or WHERE (caps sensitive!)
      # @return {Hash}
      # @example
      #   YellowApi.get_type_ahead("au", "en", "WHAT")
      #   YellowApi.get_type_ahead("monc", "en", "WHERE")
      def get_type_ahead(text, lang, field)
        get('/GetTypeAhead/', { :text => text, :lang => lang })
      end

    end
  end
end
