```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.update_o_auth2_oidc(
    client_id: '<CLIENT_ID>', # optional
    client_secret: '<CLIENT_SECRET>', # optional
    well_known_url: 'https://example.com', # optional
    authorization_url: 'https://example.com', # optional
    token_url: 'https://example.com', # optional
    user_info_url: 'https://example.com', # optional
    enabled: false # optional
)
```
