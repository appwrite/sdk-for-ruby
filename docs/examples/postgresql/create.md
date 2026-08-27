```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

postgresql = Postgresql.new(client)

result = postgresql.create(
    database_id: '<DATABASE_ID>',
    name: '<NAME>',
    version: '17', # optional
    specification: '<SPECIFICATION>', # optional
    replicas: 0, # optional
    sync_mode: 'async', # optional
    network_idle_timeout_seconds: 60, # optional
    network_ip_allowlist: [], # optional
    idle_timeout_minutes: 5, # optional
    pitr: false, # optional
    pitr_retention_days: 1, # optional
    storage_autoscaling: false, # optional
    storage_autoscaling_threshold_percent: 50, # optional
    storage_autoscaling_max_gb: 0 # optional
)
```
