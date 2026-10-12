```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.update_o_auth2_auth0(
    client_id: '<CLIENT_ID>', # optional
    client_secret: '<CLIENT_SECRET>', # optional
    endpoint: '<ENDPOINT>', # optional
    prompt: [ProjectOAuth2Auth0Prompt::NONE], # optional
    enabled: false # optional
)
```
