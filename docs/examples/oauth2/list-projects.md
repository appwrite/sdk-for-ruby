```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

oauth2 = Oauth2.new(client)

result = oauth2.list_projects(
    limit: 1, # optional
    offset: 0, # optional
    search: '<SEARCH>' # optional
)
```
