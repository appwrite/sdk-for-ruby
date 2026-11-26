```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

videos = Videos.new(client)

result = videos.create_rendition(
    video_id: '<VIDEO_ID>',
    profile_id: '<PROFILE_ID>',
    output: VideoOutput::HLS
)
```
