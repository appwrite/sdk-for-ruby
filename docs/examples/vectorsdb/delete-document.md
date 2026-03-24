```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

vectors_db = VectorsDB.new(client)

result = vectors_db.delete_document(
    database_id: '<DATABASE_ID>',
    collection_id: '<COLLECTION_ID>',
    document_id: '<DOCUMENT_ID>',
    transaction_id: '<TRANSACTION_ID>' # optional
)
```
