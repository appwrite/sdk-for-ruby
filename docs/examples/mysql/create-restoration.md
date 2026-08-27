```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

mysql = Mysql.new(client)

result = mysql.create_restoration(
    database_id: '<DATABASE_ID>',
    type: 'backup', # optional
    backup_id: '<BACKUP_ID>', # optional
    target_database_id: '<TARGET_DATABASE_ID>', # optional
    target_time: '2020-10-15T06:38:00.000+00:00' # optional
)
```
