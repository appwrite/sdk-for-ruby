```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

monitors = Monitors.new(client)

result = monitors.create_http_monitor(
    monitor_id: '<MONITOR_ID>',
    name: '<NAME>',
    url: 'https://api.example.com/health',
    method: MonitorMethod::GET, # optional
    headers: {
        "Authorization" => 'Bearer <TOKEN>'
    }, # optional
    body: '<BODY>', # optional
    rules: [
        Query.or([
            Query.not_between('statusCode', 200, 299),
            Query.greater_than('latency', 2000)
        ])
    ], # optional
    interval: 60, # optional
    timeout: 10, # optional
    cooldown: 300, # optional
    enabled: true, # optional
    notify: ["owner"], # optional
    severity: MonitorSeverity::INFO, # optional
    escalation_id: '<ESCALATION_ID>' # optional
)
```
