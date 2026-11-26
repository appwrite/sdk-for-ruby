```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

alerts = Alerts.new(client)

result = alerts.update(
    alert_id: '<ALERT_ID>',
    acknowledged: true
)
```
