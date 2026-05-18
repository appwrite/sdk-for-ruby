```ruby
require 'appwrite'

include Appwrite
include Appwrite::Permission
include Appwrite::Role

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

presences = Presences.new(client)

result = presences.upsert(
    presence_id: '<PRESENCE_ID>',
    user_id: '<USER_ID>',
    status: '<STATUS>',
    permissions: [Permission.read(Role.any())], # optional
    expires_at: '2020-10-15T06:38:00.000+00:00', # optional
    metadata: {} # optional
)
```
