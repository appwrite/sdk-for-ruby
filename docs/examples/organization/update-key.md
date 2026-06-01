```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

organization = Organization.new(client)

result = organization.update_key(
    key_id: '<KEY_ID>',
    name: '<NAME>',
    scopes: [OrganizationKeyScopes::PROJECTS_READ],
    expire: '2020-10-15T06:38:00.000+00:00' # optional
)
```
