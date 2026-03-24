```ruby
require 'appwrite'

include Appwrite
include Appwrite::Permission
include Appwrite::Role

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

vectors_db = VectorsDB.new(client)

result = vectors_db.create_document(
    database_id: '<DATABASE_ID>',
    collection_id: '<COLLECTION_ID>',
    document_id: '<DOCUMENT_ID>',
    data: {
        "embeddings" => {
          "0" => 0.12,
          "1" => -0.55,
          "2" => 0.88,
          "3" => 1.02
      },
        "metadata" => {
          "key" => "value"
      }
    },
    permissions: [Permission.read(Role.any())] # optional
)
```
