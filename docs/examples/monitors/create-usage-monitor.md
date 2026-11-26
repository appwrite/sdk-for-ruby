```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

monitors = Monitors.new(client)

result = monitors.create_usage_monitor(
    monitor_id: '<MONITOR_ID>',
    name: '<NAME>',
    rules: [
        Query.greater_than('network.outbound', 5000000000)
    ],
    window: 3600, # optional
    cooldown: 1800, # optional
    enabled: true, # optional
    notify: ["owner"], # optional
    severity: MonitorSeverity::INFO, # optional
    escalation_id: '<ESCALATION_ID>' # optional
)
```
