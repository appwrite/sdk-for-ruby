```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

avatars = Avatars.new(client)

result = avatars.get_photo(
    width: 0, # optional
    height: 0, # optional
    quality: 0, # optional
    output: 'png', # optional
    rating: 'g', # optional
    user_id: 'current()', # optional
    email_hash: '<EMAIL_HASH>', # optional
    name: '<NAME>' # optional
)
```
