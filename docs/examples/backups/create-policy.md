```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

backups = Backups.new(client)

result = backups.create_policy(
    policy_id: '<POLICY_ID>',
    services: [BackupServices::DATABASES],
    retention: 1,
    schedule: '',
    name: '<NAME>', # optional
    resource_id: '<RESOURCE_ID>', # optional
    enabled: false # optional
)
```
