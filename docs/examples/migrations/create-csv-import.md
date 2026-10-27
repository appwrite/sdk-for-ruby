```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

migrations = Migrations.new(client)

result = migrations.create_csv_import(
    bucket_id: '<BUCKET_ID>',
    file_id: '<FILE_ID>',
    database_id: '<DATABASE_ID>',
    collection_id: '<COLLECTION_ID>',
    internal_file: false, # optional
    on_duplicate: OnDuplicate::FAIL # optional
)
```
