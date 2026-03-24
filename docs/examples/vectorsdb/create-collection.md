```ruby
require 'appwrite'

include Appwrite
include Appwrite::Permission
include Appwrite::Role

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

vectors_db = VectorsDB.new(client)

result = vectors_db.create_collection(
    database_id: '<DATABASE_ID>',
    collection_id: '<COLLECTION_ID>',
    name: '<NAME>',
    dimension: 1,
    permissions: [Permission.read(Role.any())], # optional
    document_security: false, # optional
    enabled: false # optional
)
```
