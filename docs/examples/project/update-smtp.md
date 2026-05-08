```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.update_smtp(
    host: '', # optional
    port: null, # optional
    username: '<USERNAME>', # optional
    password: '<PASSWORD>', # optional
    sender_email: 'email@example.com', # optional
    sender_name: '<SENDER_NAME>', # optional
    reply_to_email: 'email@example.com', # optional
    reply_to_name: '<REPLY_TO_NAME>', # optional
    secure: Secure::TLS, # optional
    enabled: false # optional
)
```
