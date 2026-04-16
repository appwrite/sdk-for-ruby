```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

messaging = Messaging.new(client)

result = messaging.update_sms(
    message_id: '<MESSAGE_ID>',
    topics: [], # optional
    users: [], # optional
    targets: [], # optional
    content: '<CONTENT>', # optional
    draft: false, # optional
    scheduled_at: '2020-10-15T06:38:00.000+00:00' # optional
)
```
