```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

apps = Apps.new(client)

result = apps.list_installations(
    app_id: '<APP_ID>',
    queries: [], # optional
    total: false # optional
)
```
