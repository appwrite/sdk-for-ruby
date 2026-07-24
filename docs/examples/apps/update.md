```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

apps = Apps.new(client)

result = apps.update(
    app_id: '<APP_ID>',
    name: '<NAME>',
    description: '<DESCRIPTION>', # optional
    client_uri: 'https://example.com', # optional
    logo_uri: 'https://example.com', # optional
    privacy_policy_url: 'https://example.com', # optional
    terms_url: 'https://example.com', # optional
    contacts: [], # optional
    tagline: '<TAGLINE>', # optional
    tags: [], # optional
    images: [], # optional
    support_url: 'https://example.com', # optional
    data_deletion_url: 'https://example.com', # optional
    enabled: false, # optional
    redirect_uris: [], # optional
    post_logout_redirect_uris: [], # optional
    type: 'public', # optional
    device_flow: false, # optional
    installation_scopes: [], # optional
    installation_redirect_url: 'https://example.com' # optional
)
```
