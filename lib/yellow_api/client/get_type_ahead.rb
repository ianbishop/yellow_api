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
      # @param field [Symbol] Which field to suggest, :what or :where
      # @param lang [String] Suggestion languages (en - English [default], fr - French)
      # @return {Hash}
      # @example
      #   YellowApi.get_type_ahead("au", :what)
      #   YellowApi.get_type_ahead("monc", :where, "fr")
      def get_type_ahead(text, field, lang="en")
        options = {
          :text => text,
          :lang => lang,
          :field => field.to_s.upcase
        }
        get('/GetTypeAhead/', options)
      end

    end
  end
end
