```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

vectors_db = VectorsDB.new(client)

result = vectors_db.create_index(
    database_id: '<DATABASE_ID>',
    collection_id: '<COLLECTION_ID>',
    key: '',
    type: VectorsDBIndexType::HNSW_EUCLIDEAN,
    attributes: [],
    orders: [OrderBy::ASC], # optional
    lengths: [] # optional
)
```
