```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.update_o_auth2_server(
    enabled: false,
    authorization_url: 'https://example.com',
    scopes: [], # optional
    authorization_details_types: [], # optional
    access_token_duration: 60, # optional
    refresh_token_duration: 60, # optional
    public_access_token_duration: 60, # optional
    public_refresh_token_duration: 60, # optional
    installation_access_token_duration: 60, # optional
    confidential_pkce: false, # optional
    verification_url: 'https://example.com', # optional
    user_code_length: 6, # optional
    user_code_format: 'numeric', # optional
    device_code_duration: 60, # optional
    default_scopes: [], # optional
    installation_scopes: [] # optional
)
```
