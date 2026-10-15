```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

oauth2 = Oauth2.new(client)

result = oauth2.revoke(
    token: '<TOKEN>',
    token_type_hint: 'access_token', # optional
    client_id: '<CLIENT_ID>', # optional
    client_secret: '<CLIENT_SECRET>' # optional
)
```
