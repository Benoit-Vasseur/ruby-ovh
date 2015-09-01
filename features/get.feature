Feature: Get
  In order to Get my resources on OVH
  As a OVH customer
  I want to make Get to the OVH API

  Scenario: Get request
    Given I created an OVH client with my credentials
    When I get '/me' with the sdk
    Then I should call the '/me' method of the http API
