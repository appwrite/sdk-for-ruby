```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.create_variable(
    variable_id: '<VARIABLE_ID>',
    key: '<KEY>',
    value: '<VALUE>',
    secret: false # optional
)
```
