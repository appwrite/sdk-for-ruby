```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

vectors_db = VectorsDB.new(client)

result = vectors_db.list_operations(
    database_id: '<DATABASE_ID>',
    status: 'queued', # optional
    limit: 1, # optional
    offset: 0 # optional
)
```
