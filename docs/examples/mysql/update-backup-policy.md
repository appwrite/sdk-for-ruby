```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

mysql = Mysql.new(client)

result = mysql.update_backup_policy(
    database_id: '<DATABASE_ID>',
    policy_id: '<POLICY_ID>',
    name: '<NAME>', # optional
    schedule: '', # optional
    retention: 1, # optional
    enabled: false # optional
)
```
