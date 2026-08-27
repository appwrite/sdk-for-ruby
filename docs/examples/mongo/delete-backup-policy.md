```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

mongo = Mongo.new(client)

result = mongo.delete_backup_policy(
    database_id: '<DATABASE_ID>',
    policy_id: '<POLICY_ID>'
)
```
