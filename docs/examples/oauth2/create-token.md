```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_session('') # The user session to authenticate with
    .set_project('<YOUR_PROJECT_ID>') # Your project ID

oauth2 = Oauth2.new(client)

result = oauth2.create_token(
    grant_type: '<GRANT_TYPE>',
    code: '<CODE>', # optional
    refresh_token: '<REFRESH_TOKEN>', # optional
    device_code: '<DEVICE_CODE>', # optional
    client_id: '<CLIENT_ID>', # optional
    client_secret: '<CLIENT_SECRET>', # optional
    code_verifier: '<CODE_VERIFIER>', # optional
    redirect_uri: 'https://example.com', # optional
    resource: '', # optional
    audience: '<AUDIENCE>' # optional
)
```
