```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

advisor = Advisor.new(client)

result = advisor.get_insight(
    report_id: '<REPORT_ID>',
    insight_id: '<INSIGHT_ID>'
)
```
