```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

databases = Databases.new(client)

result = databases.update_datetime_attribute(
    database_id: '<DATABASE_ID>',
    collection_id: '<COLLECTION_ID>',
    key: '',
    required: false,
    default: '2020-10-15T06:38:00.000+00:00',
    new_key: '' # optional
)
```
