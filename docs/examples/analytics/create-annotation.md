```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

analytics = Analytics.new(client)

result = analytics.create_annotation(
    property_id: '<PROPERTY_ID>',
    annotation_id: '<ANNOTATION_ID>',
    date: '2020-10-15T06:38:00.000+00:00',
    content: '<CONTENT>'
)
```
