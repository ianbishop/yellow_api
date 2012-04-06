require 'yellow_api/version'

module YellowApi

  # Defines constants for default configuration
  module Config

    DEFAULT_APIKEY = nil

    # The endpoint that will be used to connect if none is set and
    # mode is not set to sandbox
    #
    # @see http://www.yellowapi.com/docs/places/#doc_char
    DEFAULT_ENDPOINT = "http://api.yellowapi.com"

    # The endpoint that will be used to connect if none is set and
    # mode is set to sandbox
    #
    # @see http://www.yellowapi.com/docs/places/#doc_char
    DEFAULT_SANDBOX_ENDPOINT = "http://api.sandbox.yellowapi.com"

    # Sets the configuration for which type of API key is being used
    # @note Changing this to be enabled will automatically switch to using the DEFAULT_SANDBOX_ENDPOINT
    # @see http://www.yellowapi.com/docs/places/#doc_char
    DEFAULT_SANDBOX_ENABLED = false

    # Content type of response to be consumed
    # @note This is currently fixed at JSON, as there is no XML support at this time
    DEFAULT_FMT="JSON"

    # Keys which can be configured 
    VALID_OPTIONS_KEYS = [
      :apikey,
      :endpoint,
      :sandbox_endpoint,
      :sandbox_enabled,
      :fmt
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configurations back to defaults
    def self.extend(base)
      base.reset
    end

    # Allows configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each do |k|
        options[k] = send(k)
      end
      options
    end

    # Reset all configurations back to defaults
    def reset
      self.apikey = DEFAULT_APIKEY
      self.endpoint = DEFAULT_ENDPOINT
      self.sandbox_endpoint = DEFAULT_SANDBOX_ENDPOINT
      self.sandbox_enabled = DEFAULT_SANDBOX_ENABLED
      self.fmt = DEFAULT_FMT
    end
  end
end
