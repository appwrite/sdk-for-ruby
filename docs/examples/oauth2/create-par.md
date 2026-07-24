```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_session('') # The user session to authenticate with
    .set_project('<YOUR_PROJECT_ID>') # Your project ID

oauth2 = Oauth2.new(client)

result = oauth2.create_par(
    client_id: '<CLIENT_ID>',
    redirect_uri: 'https://example.com',
    response_type: 'code',
    scope: '<SCOPE>', # optional
    state: '<STATE>', # optional
    nonce: '<NONCE>', # optional
    code_challenge: '<CODE_CHALLENGE>', # optional
    code_challenge_method: 's256', # optional
    prompt: '<PROMPT>', # optional
    max_age: 0, # optional
    authorization_details: '<AUTHORIZATION_DETAILS>', # optional
    resource: '', # optional
    audience: '<AUDIENCE>' # optional
)
```
