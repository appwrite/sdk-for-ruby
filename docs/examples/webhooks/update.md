```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

webhooks = Webhooks.new(client)

result = webhooks.update(
    webhook_id: '<WEBHOOK_ID>',
    name: '<NAME>',
    url: '',
    events: [],
    enabled: false, # optional
    security: false, # optional
    http_user: '<HTTP_USER>', # optional
    http_pass: '<HTTP_PASS>' # optional
)
```
