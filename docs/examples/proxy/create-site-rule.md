```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

proxy = Proxy.new(client)

result = proxy.create_site_rule(
    domain: '',
    site_id: '<SITE_ID>',
    branch: '<BRANCH>' # optional
)
```
