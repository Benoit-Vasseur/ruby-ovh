require_relative 'client'

# access_rules = {
#   accessRules:[
#     {
#       method: 'GET',
#       path: '/*'
#     }
#   ]
# }

c = OVH::Client.new
# resp = c.request_consummerkey(access_rules)
resp = c.get('/me')
