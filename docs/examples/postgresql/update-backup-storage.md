```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

postgresql = Postgresql.new(client)

result = postgresql.update_backup_storage(
    database_id: '<DATABASE_ID>',
    provider: 's3',
    bucket: '<BUCKET>',
    access_key: '<ACCESS_KEY>',
    secret_key: '<SECRET_KEY>',
    region: '<REGION>', # optional
    prefix: '<PREFIX>', # optional
    endpoint: '<ENDPOINT>' # optional
)
```
