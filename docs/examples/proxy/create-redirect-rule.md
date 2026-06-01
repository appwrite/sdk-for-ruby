```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

proxy = Proxy.new(client)

result = proxy.create_redirect_rule(
    domain: '',
    url: 'https://example.com',
    status_code: StatusCode::MOVEDPERMANENTLY,
    resource_id: '<RESOURCE_ID>',
    resource_type: ProxyResourceType::SITE
)
```
