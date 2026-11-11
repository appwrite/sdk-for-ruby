```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

proxy = Proxy.new(client)

result = proxy.update_site_rule(
    rule_id: '<RULE_ID>',
    site_id: '<SITE_ID>',
    branch: '<BRANCH>' # optional
)
```
