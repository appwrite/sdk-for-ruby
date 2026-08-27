```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

mysql = Mysql.new(client)

result = mysql.update_pooler(
    database_id: '<DATABASE_ID>',
    mode: 'transaction', # optional
    max_connections: 10, # optional
    default_pool_size: 1, # optional
    read_write_splitting: false, # optional
    pooler_cpu_request: '<POOLER_CPU_REQUEST>', # optional
    pooler_cpu_limit: '<POOLER_CPU_LIMIT>', # optional
    pooler_memory_request: '<POOLER_MEMORY_REQUEST>', # optional
    pooler_memory_limit: '<POOLER_MEMORY_LIMIT>' # optional
)
```
