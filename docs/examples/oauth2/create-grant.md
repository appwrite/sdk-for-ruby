```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_session('') # The user session to authenticate with
    .set_project('<YOUR_PROJECT_ID>') # Your project ID

oauth2 = Oauth2.new(client)

result = oauth2.create_grant(
    user_code: '<USER_CODE>'
)
```
