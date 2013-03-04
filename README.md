# Yellow API

Ruby wrapper for the YellowPages' [YellowAPI](http://www.yellowapi.com).

## Installation
``` bash
$ gem install yellow_api
```
## Usage
  
### Creating a client
``` ruby
# Production
@client = YellowApi.new(:apikey => "yourapikeygoeshere")

# Sandbox
@client = YellowApi.new(:apikey => "sandboxapikey", :sandbox_enabled => true)
```
### Find businesses by listing
``` ruby
@client.find_business("barber", "Ottawa")

@client.find_business("barber", "Ottawa", { :pgLen => 10 }) # Limit to 10 listings
```

### Get business details

``` ruby
my_barber = @client.find_business("barber", "Ottawa").listings.first
@client.get_business_details(my_barber.address.prov, my_barber.name, my_barber.id)
```

### Find dealers
``` ruby
@client.find_dealer(6418182, { :pgLen => 10 })
```

### Get type ahead

``` ruby
@client.get_type_ahead("auto", :what)
@client.get_type_ahead("monct", :where)
```

## Documentation
[See here](http://rdoc.info/github/ianbishop/yellow_api/master/YellowApi)

[Official API docs](http://www.yellowapi.com/docs/places)

## Inspiration
API style was largely inspired by sferik's [twitter](https://github.com/sferik/twitter).

## Copyright
See [LICENSE](https://github.com/ianbishop/yellow_api/blob/master/LICENSE.md) for more details.
