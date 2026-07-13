```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

organization = Organization.new(client)

result = organization.create_membership(
    roles: [],
    email: 'email@example.com', # optional
    user_id: '<USER_ID>', # optional
    phone: '+12065550100', # optional
    url: 'https://example.com', # optional
    name: '<NAME>' # optional
)
```
