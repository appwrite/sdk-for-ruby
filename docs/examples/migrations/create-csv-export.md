```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

migrations = Migrations.new(client)

result = migrations.create_csv_export(
    database_id: '<DATABASE_ID>',
    collection_id: '<COLLECTION_ID>',
    filename: '<FILENAME>',
    columns: [], # optional
    queries: [], # optional
    delimiter: '<DELIMITER>', # optional
    enclosure: '<ENCLOSURE>', # optional
    escape: '<ESCAPE>', # optional
    header: false, # optional
    notify: false # optional
)
```
