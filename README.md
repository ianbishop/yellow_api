# Yellow API

Ruby wrapper for the YellowPages' [YellowAPI](http://www.yellowapi.com).

## Installation
    gem install yellow_api

## Examples

    require 'yellow_api'
    
    # Creating a client
    @client = YellowApi.new(:apikey => "yourapikeygoeshere")
    
    @client = YellowApi.new(:apikey => "sandboxapikey", :sandbox_enabled => true)

    # Find businesses by listing
    @client.find_business("barber", "Ottawa")

    @client.find_business("barber", "Ottawa", { :pgLen => 10 }) # Limit to 10

    # Get business details
    my_barber = @client.find_business("barber", "Ottawa").listings.first
    @client.get_business_details("Ontario", my_barber.name, my_barber.listingId)

    # Find dealers
    @client.find_dealer(6418182, { :pgLen => 10 })

    # Get type ahead
    @client.get_type_ahead("auto", :what)
    @client.get_type_ahead("monct", :where)

## Documentation
[See here](http://rdoc.info/github/ianbishop/yellow_api/master/YellowApi)

[Official API docs](http://www.yellowapi.com/docs/places)

## Inspiration
API style was largely stolen/inspired by [hacker_news_search](https://github.com/ryanatwork/hacker_news_search) and [twitter](https://github.com/jnunemaker/twitter).

## Copyright
See [LICENSE](https://github.com/ianbishop/yellow_api/blob/master/LICENSE.md) for more details.
