```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

backups = Backups.new(client)

result = backups.update_policy(
    policy_id: '<POLICY_ID>',
    name: '<NAME>', # optional
    retention: 1, # optional
    schedule: '', # optional
    enabled: false # optional
)
```
