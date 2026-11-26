```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

videos = Videos.new(client)

result = videos.delete_rendition(
    video_id: '<VIDEO_ID>',
    rendition_id: '<RENDITION_ID>'
)
```
