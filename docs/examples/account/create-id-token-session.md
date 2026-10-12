```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

account = Account.new(client)

result = account.create_id_token_session(
    provider: IdTokenProvider::APPLE,
    id_token: '<ID_TOKEN>',
    nonce: '<NONCE>', # optional
    access_token: '<ACCESS_TOKEN>', # optional
    access_token_expiry: 0, # optional
    name: '<NAME>' # optional
)
```
