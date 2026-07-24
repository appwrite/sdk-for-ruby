```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

organization = Organization.new(client)

result = organization.update_installation(
    installation_id: '<INSTALLATION_ID>',
    authorization_details: '<AUTHORIZATION_DETAILS>' # optional
)
```
