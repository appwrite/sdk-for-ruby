```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.update_o_auth2_apple(
    service_id: '<SERVICE_ID>', # optional
    key_id: '<KEY_ID>', # optional
    team_id: '<TEAM_ID>', # optional
    p8_file: '<P8_FILE>', # optional
    enabled: false # optional
)
```
