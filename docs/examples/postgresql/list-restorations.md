```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

postgresql = Postgresql.new(client)

result = postgresql.list_restorations(
    database_id: '<DATABASE_ID>',
    status: 'pending', # optional
    type: 'backup', # optional
    limit: 1, # optional
    offset: 0 # optional
)
```
