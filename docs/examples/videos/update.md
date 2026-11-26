```ruby
require 'appwrite'

include Appwrite
include Appwrite::Permission
include Appwrite::Role

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

videos = Videos.new(client)

result = videos.update(
    video_id: '<VIDEO_ID>',
    name: '<NAME>', # optional
    permissions: [Permission.read(Role.any())] # optional
)
```
