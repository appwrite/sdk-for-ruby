```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

videos = Videos.new(client)

result = videos.get_caption_manifest(
    video_id: '<VIDEO_ID>',
    output: VideoOutput::HLS,
    caption_id: '<CAPTION_ID>'
)
```
