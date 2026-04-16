```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.update_windows_platform(
    platform_id: '<PLATFORM_ID>',
    name: '<NAME>',
    package_identifier_name: '<PACKAGE_IDENTIFIER_NAME>'
)
```
