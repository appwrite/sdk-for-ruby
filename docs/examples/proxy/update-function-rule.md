```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

proxy = Proxy.new(client)

result = proxy.update_function_rule(
    rule_id: '<RULE_ID>',
    function_id: '<FUNCTION_ID>',
    branch: '<BRANCH>' # optional
)
```
