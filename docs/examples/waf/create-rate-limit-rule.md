```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

waf = Waf.new(client)

result = waf.create_rate_limit_rule(
    rule_id: '<RULE_ID>',
    resource_type: 'api',
    name: '<NAME>',
    limit: 1,
    interval: 1,
    resource_id: '<RESOURCE_ID>', # optional
    description: '<DESCRIPTION>', # optional
    key: 'ip', # optional
    strategy: 'fixedWindow', # optional
    max_bucket_size: 1, # optional
    priority: -100000, # optional
    enabled: false, # optional
    conditions: [] # optional
)
```
