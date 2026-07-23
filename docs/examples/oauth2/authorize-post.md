```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_session('') # The user session to authenticate with
    .set_project('<YOUR_PROJECT_ID>') # Your project ID

oauth2 = Oauth2.new(client)

result = oauth2.authorize_post(
    client_id: '<CLIENT_ID>', # optional
    redirect_uri: 'https://example.com', # optional
    response_type: '', # optional
    scope: '<SCOPE>', # optional
    state: '<STATE>', # optional
    nonce: '<NONCE>', # optional
    code_challenge: '<CODE_CHALLENGE>', # optional
    code_challenge_method: 's256', # optional
    prompt: '<PROMPT>', # optional
    max_age: 0, # optional
    authorization_details: '<AUTHORIZATION_DETAILS>', # optional
    resource: '', # optional
    audience: '<AUDIENCE>', # optional
    request_uri: '<REQUEST_URI>' # optional
)
```
