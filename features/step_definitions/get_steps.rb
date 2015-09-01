
Given(/^I created an OVH client with my credentials$/) do
  # pending # Write code here that turns the phrase above into concrete actions

  @client = OVH::Client.new(application_key: 'app_key', application_secret: 'app_secret', consumer_key: 'consumer_key')
end

When(/^I get '\/me' with the sdk$/) do
  # pending # Write code here that turns the phrase above into concrete actions
  stub_request(:get, "https://eu.api.ovh.com/1.0/me")
  allow(Time).to receive(:now).and_return(Time.mktime(2010,10,8))
  @client.get('/me')
end

Then(/^I should call the '\/me' method of the http API$/) do
  # pending # Write code here that turns the phrase above into concrete actions
  expect(WebMock).to have_requested(:get, "https://eu.api.ovh.com/1.0/me").
  with(:headers => {
    'Accept'=>'*/*',
    'X-Ovh-Application'=>'app_key',
    'X-Ovh-Consumer'=>'consumer_key',
    'X-Ovh-Signature'=>'$1$c1635742d2635391138e135e04a78d268e20232d',
    'X-Ovh-Timestamp'=>'1286488800'})
end
