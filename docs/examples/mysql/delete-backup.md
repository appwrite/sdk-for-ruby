```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

mysql = Mysql.new(client)

result = mysql.delete_backup(
    database_id: '<DATABASE_ID>',
    backup_id: '<BACKUP_ID>'
)
```
