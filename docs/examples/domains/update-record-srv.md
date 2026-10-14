```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

domains = Domains.new(client)

result = domains.update_record_srv(
    domain_id: '<DOMAIN_ID>',
    record_id: '<RECORD_ID>',
    name: '',
    value: '<VALUE>',
    ttl: 1,
    priority: 0,
    weight: 0,
    port: 0,
    comment: '<COMMENT>' # optional
)
```
