# Important note
This is not an official repository of OVH and this is a work in progress

Lightweight wrapper around OVH's APIs. Handles all the hard work including credential creation and requests signing.

```ruby
require_relative 'client'

client = OVH::Client.new(
  application_key: '<app key>',
  application_secret: '<app secret>',
  consumer_key: '<consumer key>'
)

puts client.get('/me').body['firstname']
```

# Installation
For now you have to clone the repo and make a bundle.

# Example usage

### Use the API on behalf of a user

1. Create an application

  To interact with the APIs, the SDK needs to identify itself using an application_key and an application_secret. To get them, you need to register your application.
  For now only the OVH Europe API is supported.
    - [OVH Europe](https://eu.api.ovh.com/createApp/)

  Once created, you will obtain an __application key (AK)__ and an __application secret (AS)__.

2. Configure your application

  The easiest and safest way to use your application's credentials is create a conf.yml configuration file in application's working directory. Here is how it looks like:
  ```yaml
  application_key: app_key
  application_secret: app_secret
  # consumer_key: consumer_key
  ```

3. Authorize your application to access a customer account

  To allow your application to access a customer account using the API on your behalf, you need a __consumer key (CK)__.

  Here is a sample code you can use to allow your application to access a customer's informations:

```ruby
require_relative 'client'
# create a client using configuration
client =  OVH::Client.new

# Request RO, /me API access
access_rules = {
  accessRules: [
    {'method' => 'GET', 'path' => '/me'}
  ]
}

# Request token
validation = JSON.parse(client.request_consumerkey(access_rules).body)

puts "Please visit #{validation['validationUrl']}"
puts "Then press Enter"
gets

puts "Welcome #{JSON.parse(client.get('/me').body)['firstname']}"
puts "Btw, your consumerKey is #{validation['consumerKey']}"
```

  Returned __consumerKey__ should then be kept to avoid re-authenticating your end-user on each use.

  To request full and unlimited access to the API, you may use wildcards:

```ruby
access_rules = [
  {'method': 'GET', 'path': '/*'},
  {'method': 'POST', 'path': '/*'},
  {'method': 'PUT', 'path': '/*'},
  {'method': 'DELETE', 'path': '/*'}
]
```

# Run the tests
For now the only test is a _Cucumber_ test (integration test).
More tests will come (cucmber and Rspec)

```
cucumber
```

# Build the documentation
Documentation is managed with _Yard_

```
yard
```
